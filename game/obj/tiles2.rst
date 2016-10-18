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
   7B42                      53 _g_tiles2_00:
   7B42 C3                   54 	.db #0xC3	; 195
   7B43 C3                   55 	.db #0xC3	; 195
   7B44 C6                   56 	.db #0xC6	; 198
   7B45 C3                   57 	.db #0xC3	; 195
   7B46 C3                   58 	.db #0xC3	; 195
   7B47 C3                   59 	.db #0xC3	; 195
   7B48 C3                   60 	.db #0xC3	; 195
   7B49 C6                   61 	.db #0xC6	; 198
   7B4A                      62 _g_tiles2_01:
   7B4A CC                   63 	.db #0xCC	; 204
   7B4B CF                   64 	.db #0xCF	; 207
   7B4C CE                   65 	.db #0xCE	; 206
   7B4D C9                   66 	.db #0xC9	; 201
   7B4E CB                   67 	.db #0xCB	; 203
   7B4F CC                   68 	.db #0xCC	; 204
   7B50 CB                   69 	.db #0xCB	; 203
   7B51 CE                   70 	.db #0xCE	; 206
   7B52                      71 _g_tiles2_02:
   7B52 CE                   72 	.db #0xCE	; 206
   7B53 CD                   73 	.db #0xCD	; 205
   7B54 C7                   74 	.db #0xC7	; 199
   7B55 CC                   75 	.db #0xCC	; 204
   7B56 C3                   76 	.db #0xC3	; 195
   7B57 CE                   77 	.db #0xCE	; 206
   7B58 C9                   78 	.db #0xC9	; 201
   7B59 C7                   79 	.db #0xC7	; 199
   7B5A                      80 _g_tiles2_03:
   7B5A CC                   81 	.db #0xCC	; 204
   7B5B CF                   82 	.db #0xCF	; 207
   7B5C CC                   83 	.db #0xCC	; 204
   7B5D CC                   84 	.db #0xCC	; 204
   7B5E CE                   85 	.db #0xCE	; 206
   7B5F CF                   86 	.db #0xCF	; 207
   7B60 CE                   87 	.db #0xCE	; 206
   7B61 CF                   88 	.db #0xCF	; 207
   7B62                      89 _g_tiles2_04:
   7B62 CF                   90 	.db #0xCF	; 207
   7B63 CC                   91 	.db #0xCC	; 204
   7B64 CC                   92 	.db #0xCC	; 204
   7B65 CC                   93 	.db #0xCC	; 204
   7B66 CF                   94 	.db #0xCF	; 207
   7B67 CD                   95 	.db #0xCD	; 205
   7B68 CF                   96 	.db #0xCF	; 207
   7B69 CD                   97 	.db #0xCD	; 205
   7B6A                      98 _g_tiles2_05:
   7B6A FF                   99 	.db #0xFF	; 255
   7B6B FF                  100 	.db #0xFF	; 255
   7B6C FF                  101 	.db #0xFF	; 255
   7B6D FF                  102 	.db #0xFF	; 255
   7B6E FF                  103 	.db #0xFF	; 255
   7B6F FF                  104 	.db #0xFF	; 255
   7B70 FF                  105 	.db #0xFF	; 255
   7B71 FF                  106 	.db #0xFF	; 255
   7B72                     107 _g_tiles2_06:
   7B72 CB                  108 	.db #0xCB	; 203
   7B73 CF                  109 	.db #0xCF	; 207
   7B74 C9                  110 	.db #0xC9	; 201
   7B75 C7                  111 	.db #0xC7	; 199
   7B76 CC                  112 	.db #0xCC	; 204
   7B77 C3                  113 	.db #0xC3	; 195
   7B78 CE                  114 	.db #0xCE	; 206
   7B79 CF                  115 	.db #0xCF	; 207
   7B7A                     116 _g_tiles2_07:
   7B7A CC                  117 	.db #0xCC	; 204
   7B7B C7                  118 	.db #0xC7	; 199
   7B7C CE                  119 	.db #0xCE	; 206
   7B7D CD                  120 	.db #0xCD	; 205
   7B7E C3                  121 	.db #0xC3	; 195
   7B7F CC                  122 	.db #0xCC	; 204
   7B80 CF                  123 	.db #0xCF	; 207
   7B81 CE                  124 	.db #0xCE	; 206
   7B82                     125 _g_tiles2_08:
   7B82 CE                  126 	.db #0xCE	; 206
   7B83 CF                  127 	.db #0xCF	; 207
   7B84 CE                  128 	.db #0xCE	; 206
   7B85 CF                  129 	.db #0xCF	; 207
   7B86 CC                  130 	.db #0xCC	; 204
   7B87 CC                  131 	.db #0xCC	; 204
   7B88 CC                  132 	.db #0xCC	; 204
   7B89 CF                  133 	.db #0xCF	; 207
   7B8A                     134 _g_tiles2_09:
   7B8A CF                  135 	.db #0xCF	; 207
   7B8B CD                  136 	.db #0xCD	; 205
   7B8C CF                  137 	.db #0xCF	; 207
   7B8D CD                  138 	.db #0xCD	; 205
   7B8E CC                  139 	.db #0xCC	; 204
   7B8F CC                  140 	.db #0xCC	; 204
   7B90 CF                  141 	.db #0xCF	; 207
   7B91 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
