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
   4B42                      53 _g_tiles2_00:
   4B42 C3                   54 	.db #0xC3	; 195
   4B43 C3                   55 	.db #0xC3	; 195
   4B44 C6                   56 	.db #0xC6	; 198
   4B45 C3                   57 	.db #0xC3	; 195
   4B46 C3                   58 	.db #0xC3	; 195
   4B47 C3                   59 	.db #0xC3	; 195
   4B48 C3                   60 	.db #0xC3	; 195
   4B49 C6                   61 	.db #0xC6	; 198
   4B4A                      62 _g_tiles2_01:
   4B4A CC                   63 	.db #0xCC	; 204
   4B4B CF                   64 	.db #0xCF	; 207
   4B4C CE                   65 	.db #0xCE	; 206
   4B4D C9                   66 	.db #0xC9	; 201
   4B4E CB                   67 	.db #0xCB	; 203
   4B4F CC                   68 	.db #0xCC	; 204
   4B50 CB                   69 	.db #0xCB	; 203
   4B51 CE                   70 	.db #0xCE	; 206
   4B52                      71 _g_tiles2_02:
   4B52 CE                   72 	.db #0xCE	; 206
   4B53 CD                   73 	.db #0xCD	; 205
   4B54 C7                   74 	.db #0xC7	; 199
   4B55 CC                   75 	.db #0xCC	; 204
   4B56 C3                   76 	.db #0xC3	; 195
   4B57 CE                   77 	.db #0xCE	; 206
   4B58 C9                   78 	.db #0xC9	; 201
   4B59 C7                   79 	.db #0xC7	; 199
   4B5A                      80 _g_tiles2_03:
   4B5A CC                   81 	.db #0xCC	; 204
   4B5B CF                   82 	.db #0xCF	; 207
   4B5C CC                   83 	.db #0xCC	; 204
   4B5D CC                   84 	.db #0xCC	; 204
   4B5E CE                   85 	.db #0xCE	; 206
   4B5F CF                   86 	.db #0xCF	; 207
   4B60 CE                   87 	.db #0xCE	; 206
   4B61 CF                   88 	.db #0xCF	; 207
   4B62                      89 _g_tiles2_04:
   4B62 CF                   90 	.db #0xCF	; 207
   4B63 CC                   91 	.db #0xCC	; 204
   4B64 CC                   92 	.db #0xCC	; 204
   4B65 CC                   93 	.db #0xCC	; 204
   4B66 CF                   94 	.db #0xCF	; 207
   4B67 CD                   95 	.db #0xCD	; 205
   4B68 CF                   96 	.db #0xCF	; 207
   4B69 CD                   97 	.db #0xCD	; 205
   4B6A                      98 _g_tiles2_05:
   4B6A FF                   99 	.db #0xFF	; 255
   4B6B FF                  100 	.db #0xFF	; 255
   4B6C FF                  101 	.db #0xFF	; 255
   4B6D FF                  102 	.db #0xFF	; 255
   4B6E FF                  103 	.db #0xFF	; 255
   4B6F FF                  104 	.db #0xFF	; 255
   4B70 FF                  105 	.db #0xFF	; 255
   4B71 FF                  106 	.db #0xFF	; 255
   4B72                     107 _g_tiles2_06:
   4B72 CB                  108 	.db #0xCB	; 203
   4B73 CF                  109 	.db #0xCF	; 207
   4B74 C9                  110 	.db #0xC9	; 201
   4B75 C7                  111 	.db #0xC7	; 199
   4B76 CC                  112 	.db #0xCC	; 204
   4B77 C3                  113 	.db #0xC3	; 195
   4B78 CE                  114 	.db #0xCE	; 206
   4B79 CF                  115 	.db #0xCF	; 207
   4B7A                     116 _g_tiles2_07:
   4B7A CC                  117 	.db #0xCC	; 204
   4B7B C7                  118 	.db #0xC7	; 199
   4B7C CE                  119 	.db #0xCE	; 206
   4B7D CD                  120 	.db #0xCD	; 205
   4B7E C3                  121 	.db #0xC3	; 195
   4B7F CC                  122 	.db #0xCC	; 204
   4B80 CF                  123 	.db #0xCF	; 207
   4B81 CE                  124 	.db #0xCE	; 206
   4B82                     125 _g_tiles2_08:
   4B82 CE                  126 	.db #0xCE	; 206
   4B83 CF                  127 	.db #0xCF	; 207
   4B84 CE                  128 	.db #0xCE	; 206
   4B85 CF                  129 	.db #0xCF	; 207
   4B86 CC                  130 	.db #0xCC	; 204
   4B87 CC                  131 	.db #0xCC	; 204
   4B88 CC                  132 	.db #0xCC	; 204
   4B89 CF                  133 	.db #0xCF	; 207
   4B8A                     134 _g_tiles2_09:
   4B8A CF                  135 	.db #0xCF	; 207
   4B8B CD                  136 	.db #0xCD	; 205
   4B8C CF                  137 	.db #0xCF	; 207
   4B8D CD                  138 	.db #0xCD	; 205
   4B8E CC                  139 	.db #0xCC	; 204
   4B8F CC                  140 	.db #0xCC	; 204
   4B90 CF                  141 	.db #0xCF	; 207
   4B91 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
