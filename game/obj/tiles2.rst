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
   7AEA                      53 _g_tiles2_00:
   7AEA C3                   54 	.db #0xC3	; 195
   7AEB C3                   55 	.db #0xC3	; 195
   7AEC C6                   56 	.db #0xC6	; 198
   7AED C3                   57 	.db #0xC3	; 195
   7AEE C3                   58 	.db #0xC3	; 195
   7AEF C3                   59 	.db #0xC3	; 195
   7AF0 C3                   60 	.db #0xC3	; 195
   7AF1 C6                   61 	.db #0xC6	; 198
   7AF2                      62 _g_tiles2_01:
   7AF2 CC                   63 	.db #0xCC	; 204
   7AF3 CF                   64 	.db #0xCF	; 207
   7AF4 CE                   65 	.db #0xCE	; 206
   7AF5 C9                   66 	.db #0xC9	; 201
   7AF6 CB                   67 	.db #0xCB	; 203
   7AF7 CC                   68 	.db #0xCC	; 204
   7AF8 CB                   69 	.db #0xCB	; 203
   7AF9 CE                   70 	.db #0xCE	; 206
   7AFA                      71 _g_tiles2_02:
   7AFA CE                   72 	.db #0xCE	; 206
   7AFB CD                   73 	.db #0xCD	; 205
   7AFC C7                   74 	.db #0xC7	; 199
   7AFD CC                   75 	.db #0xCC	; 204
   7AFE C3                   76 	.db #0xC3	; 195
   7AFF CE                   77 	.db #0xCE	; 206
   7B00 C9                   78 	.db #0xC9	; 201
   7B01 C7                   79 	.db #0xC7	; 199
   7B02                      80 _g_tiles2_03:
   7B02 CC                   81 	.db #0xCC	; 204
   7B03 CF                   82 	.db #0xCF	; 207
   7B04 CC                   83 	.db #0xCC	; 204
   7B05 CC                   84 	.db #0xCC	; 204
   7B06 CE                   85 	.db #0xCE	; 206
   7B07 CF                   86 	.db #0xCF	; 207
   7B08 CE                   87 	.db #0xCE	; 206
   7B09 CF                   88 	.db #0xCF	; 207
   7B0A                      89 _g_tiles2_04:
   7B0A CF                   90 	.db #0xCF	; 207
   7B0B CC                   91 	.db #0xCC	; 204
   7B0C CC                   92 	.db #0xCC	; 204
   7B0D CC                   93 	.db #0xCC	; 204
   7B0E CF                   94 	.db #0xCF	; 207
   7B0F CD                   95 	.db #0xCD	; 205
   7B10 CF                   96 	.db #0xCF	; 207
   7B11 CD                   97 	.db #0xCD	; 205
   7B12                      98 _g_tiles2_05:
   7B12 FF                   99 	.db #0xFF	; 255
   7B13 FF                  100 	.db #0xFF	; 255
   7B14 FF                  101 	.db #0xFF	; 255
   7B15 FF                  102 	.db #0xFF	; 255
   7B16 FF                  103 	.db #0xFF	; 255
   7B17 FF                  104 	.db #0xFF	; 255
   7B18 FF                  105 	.db #0xFF	; 255
   7B19 FF                  106 	.db #0xFF	; 255
   7B1A                     107 _g_tiles2_06:
   7B1A CB                  108 	.db #0xCB	; 203
   7B1B CF                  109 	.db #0xCF	; 207
   7B1C C9                  110 	.db #0xC9	; 201
   7B1D C7                  111 	.db #0xC7	; 199
   7B1E CC                  112 	.db #0xCC	; 204
   7B1F C3                  113 	.db #0xC3	; 195
   7B20 CE                  114 	.db #0xCE	; 206
   7B21 CF                  115 	.db #0xCF	; 207
   7B22                     116 _g_tiles2_07:
   7B22 CC                  117 	.db #0xCC	; 204
   7B23 C7                  118 	.db #0xC7	; 199
   7B24 CE                  119 	.db #0xCE	; 206
   7B25 CD                  120 	.db #0xCD	; 205
   7B26 C3                  121 	.db #0xC3	; 195
   7B27 CC                  122 	.db #0xCC	; 204
   7B28 CF                  123 	.db #0xCF	; 207
   7B29 CE                  124 	.db #0xCE	; 206
   7B2A                     125 _g_tiles2_08:
   7B2A CE                  126 	.db #0xCE	; 206
   7B2B CF                  127 	.db #0xCF	; 207
   7B2C CE                  128 	.db #0xCE	; 206
   7B2D CF                  129 	.db #0xCF	; 207
   7B2E CC                  130 	.db #0xCC	; 204
   7B2F CC                  131 	.db #0xCC	; 204
   7B30 CC                  132 	.db #0xCC	; 204
   7B31 CF                  133 	.db #0xCF	; 207
   7B32                     134 _g_tiles2_09:
   7B32 CF                  135 	.db #0xCF	; 207
   7B33 CD                  136 	.db #0xCD	; 205
   7B34 CF                  137 	.db #0xCF	; 207
   7B35 CD                  138 	.db #0xCD	; 205
   7B36 CC                  139 	.db #0xCC	; 204
   7B37 CC                  140 	.db #0xCC	; 204
   7B38 CF                  141 	.db #0xCF	; 207
   7B39 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
