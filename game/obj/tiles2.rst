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
   5878                      53 _g_tiles2_00:
   5878 C3                   54 	.db #0xC3	; 195
   5879 C3                   55 	.db #0xC3	; 195
   587A C6                   56 	.db #0xC6	; 198
   587B C3                   57 	.db #0xC3	; 195
   587C C3                   58 	.db #0xC3	; 195
   587D C3                   59 	.db #0xC3	; 195
   587E C3                   60 	.db #0xC3	; 195
   587F C6                   61 	.db #0xC6	; 198
   5880                      62 _g_tiles2_01:
   5880 CC                   63 	.db #0xCC	; 204
   5881 CF                   64 	.db #0xCF	; 207
   5882 CE                   65 	.db #0xCE	; 206
   5883 C9                   66 	.db #0xC9	; 201
   5884 CB                   67 	.db #0xCB	; 203
   5885 CC                   68 	.db #0xCC	; 204
   5886 CB                   69 	.db #0xCB	; 203
   5887 CE                   70 	.db #0xCE	; 206
   5888                      71 _g_tiles2_02:
   5888 CE                   72 	.db #0xCE	; 206
   5889 CD                   73 	.db #0xCD	; 205
   588A C7                   74 	.db #0xC7	; 199
   588B CC                   75 	.db #0xCC	; 204
   588C C3                   76 	.db #0xC3	; 195
   588D CE                   77 	.db #0xCE	; 206
   588E C9                   78 	.db #0xC9	; 201
   588F C7                   79 	.db #0xC7	; 199
   5890                      80 _g_tiles2_03:
   5890 CC                   81 	.db #0xCC	; 204
   5891 CF                   82 	.db #0xCF	; 207
   5892 CC                   83 	.db #0xCC	; 204
   5893 CC                   84 	.db #0xCC	; 204
   5894 CE                   85 	.db #0xCE	; 206
   5895 CF                   86 	.db #0xCF	; 207
   5896 CE                   87 	.db #0xCE	; 206
   5897 CF                   88 	.db #0xCF	; 207
   5898                      89 _g_tiles2_04:
   5898 CF                   90 	.db #0xCF	; 207
   5899 CC                   91 	.db #0xCC	; 204
   589A CC                   92 	.db #0xCC	; 204
   589B CC                   93 	.db #0xCC	; 204
   589C CF                   94 	.db #0xCF	; 207
   589D CD                   95 	.db #0xCD	; 205
   589E CF                   96 	.db #0xCF	; 207
   589F CD                   97 	.db #0xCD	; 205
   58A0                      98 _g_tiles2_05:
   58A0 FF                   99 	.db #0xFF	; 255
   58A1 FF                  100 	.db #0xFF	; 255
   58A2 FF                  101 	.db #0xFF	; 255
   58A3 FF                  102 	.db #0xFF	; 255
   58A4 FF                  103 	.db #0xFF	; 255
   58A5 FF                  104 	.db #0xFF	; 255
   58A6 FF                  105 	.db #0xFF	; 255
   58A7 FF                  106 	.db #0xFF	; 255
   58A8                     107 _g_tiles2_06:
   58A8 CB                  108 	.db #0xCB	; 203
   58A9 CF                  109 	.db #0xCF	; 207
   58AA C9                  110 	.db #0xC9	; 201
   58AB C7                  111 	.db #0xC7	; 199
   58AC CC                  112 	.db #0xCC	; 204
   58AD C3                  113 	.db #0xC3	; 195
   58AE CE                  114 	.db #0xCE	; 206
   58AF CF                  115 	.db #0xCF	; 207
   58B0                     116 _g_tiles2_07:
   58B0 CC                  117 	.db #0xCC	; 204
   58B1 C7                  118 	.db #0xC7	; 199
   58B2 CE                  119 	.db #0xCE	; 206
   58B3 CD                  120 	.db #0xCD	; 205
   58B4 C3                  121 	.db #0xC3	; 195
   58B5 CC                  122 	.db #0xCC	; 204
   58B6 CF                  123 	.db #0xCF	; 207
   58B7 CE                  124 	.db #0xCE	; 206
   58B8                     125 _g_tiles2_08:
   58B8 CE                  126 	.db #0xCE	; 206
   58B9 CF                  127 	.db #0xCF	; 207
   58BA CE                  128 	.db #0xCE	; 206
   58BB CF                  129 	.db #0xCF	; 207
   58BC CC                  130 	.db #0xCC	; 204
   58BD CC                  131 	.db #0xCC	; 204
   58BE CC                  132 	.db #0xCC	; 204
   58BF CF                  133 	.db #0xCF	; 207
   58C0                     134 _g_tiles2_09:
   58C0 CF                  135 	.db #0xCF	; 207
   58C1 CD                  136 	.db #0xCD	; 205
   58C2 CF                  137 	.db #0xCF	; 207
   58C3 CD                  138 	.db #0xCD	; 205
   58C4 CC                  139 	.db #0xCC	; 204
   58C5 CC                  140 	.db #0xCC	; 204
   58C6 CF                  141 	.db #0xCF	; 207
   58C7 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
