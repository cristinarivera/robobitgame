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
   588A                      53 _g_tiles2_00:
   588A C3                   54 	.db #0xC3	; 195
   588B C3                   55 	.db #0xC3	; 195
   588C C6                   56 	.db #0xC6	; 198
   588D C3                   57 	.db #0xC3	; 195
   588E C3                   58 	.db #0xC3	; 195
   588F C3                   59 	.db #0xC3	; 195
   5890 C3                   60 	.db #0xC3	; 195
   5891 C6                   61 	.db #0xC6	; 198
   5892                      62 _g_tiles2_01:
   5892 CC                   63 	.db #0xCC	; 204
   5893 CF                   64 	.db #0xCF	; 207
   5894 CE                   65 	.db #0xCE	; 206
   5895 C9                   66 	.db #0xC9	; 201
   5896 CB                   67 	.db #0xCB	; 203
   5897 CC                   68 	.db #0xCC	; 204
   5898 CB                   69 	.db #0xCB	; 203
   5899 CE                   70 	.db #0xCE	; 206
   589A                      71 _g_tiles2_02:
   589A CE                   72 	.db #0xCE	; 206
   589B CD                   73 	.db #0xCD	; 205
   589C C7                   74 	.db #0xC7	; 199
   589D CC                   75 	.db #0xCC	; 204
   589E C3                   76 	.db #0xC3	; 195
   589F CE                   77 	.db #0xCE	; 206
   58A0 C9                   78 	.db #0xC9	; 201
   58A1 C7                   79 	.db #0xC7	; 199
   58A2                      80 _g_tiles2_03:
   58A2 CC                   81 	.db #0xCC	; 204
   58A3 CF                   82 	.db #0xCF	; 207
   58A4 CC                   83 	.db #0xCC	; 204
   58A5 CC                   84 	.db #0xCC	; 204
   58A6 CE                   85 	.db #0xCE	; 206
   58A7 CF                   86 	.db #0xCF	; 207
   58A8 CE                   87 	.db #0xCE	; 206
   58A9 CF                   88 	.db #0xCF	; 207
   58AA                      89 _g_tiles2_04:
   58AA CF                   90 	.db #0xCF	; 207
   58AB CC                   91 	.db #0xCC	; 204
   58AC CC                   92 	.db #0xCC	; 204
   58AD CC                   93 	.db #0xCC	; 204
   58AE CF                   94 	.db #0xCF	; 207
   58AF CD                   95 	.db #0xCD	; 205
   58B0 CF                   96 	.db #0xCF	; 207
   58B1 CD                   97 	.db #0xCD	; 205
   58B2                      98 _g_tiles2_05:
   58B2 FF                   99 	.db #0xFF	; 255
   58B3 FF                  100 	.db #0xFF	; 255
   58B4 FF                  101 	.db #0xFF	; 255
   58B5 FF                  102 	.db #0xFF	; 255
   58B6 FF                  103 	.db #0xFF	; 255
   58B7 FF                  104 	.db #0xFF	; 255
   58B8 FF                  105 	.db #0xFF	; 255
   58B9 FF                  106 	.db #0xFF	; 255
   58BA                     107 _g_tiles2_06:
   58BA CB                  108 	.db #0xCB	; 203
   58BB CF                  109 	.db #0xCF	; 207
   58BC C9                  110 	.db #0xC9	; 201
   58BD C7                  111 	.db #0xC7	; 199
   58BE CC                  112 	.db #0xCC	; 204
   58BF C3                  113 	.db #0xC3	; 195
   58C0 CE                  114 	.db #0xCE	; 206
   58C1 CF                  115 	.db #0xCF	; 207
   58C2                     116 _g_tiles2_07:
   58C2 CC                  117 	.db #0xCC	; 204
   58C3 C7                  118 	.db #0xC7	; 199
   58C4 CE                  119 	.db #0xCE	; 206
   58C5 CD                  120 	.db #0xCD	; 205
   58C6 C3                  121 	.db #0xC3	; 195
   58C7 CC                  122 	.db #0xCC	; 204
   58C8 CF                  123 	.db #0xCF	; 207
   58C9 CE                  124 	.db #0xCE	; 206
   58CA                     125 _g_tiles2_08:
   58CA CE                  126 	.db #0xCE	; 206
   58CB CF                  127 	.db #0xCF	; 207
   58CC CE                  128 	.db #0xCE	; 206
   58CD CF                  129 	.db #0xCF	; 207
   58CE CC                  130 	.db #0xCC	; 204
   58CF CC                  131 	.db #0xCC	; 204
   58D0 CC                  132 	.db #0xCC	; 204
   58D1 CF                  133 	.db #0xCF	; 207
   58D2                     134 _g_tiles2_09:
   58D2 CF                  135 	.db #0xCF	; 207
   58D3 CD                  136 	.db #0xCD	; 205
   58D4 CF                  137 	.db #0xCF	; 207
   58D5 CD                  138 	.db #0xCD	; 205
   58D6 CC                  139 	.db #0xCC	; 204
   58D7 CC                  140 	.db #0xCC	; 204
   58D8 CF                  141 	.db #0xCF	; 207
   58D9 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
