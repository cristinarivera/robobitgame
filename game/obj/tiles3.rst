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
   7B3A                      53 _g_tiles3_00:
   7B3A FC                   54 	.db #0xFC	; 252
   7B3B FC                   55 	.db #0xFC	; 252
   7B3C FC                   56 	.db #0xFC	; 252
   7B3D FC                   57 	.db #0xFC	; 252
   7B3E FC                   58 	.db #0xFC	; 252
   7B3F FC                   59 	.db #0xFC	; 252
   7B40 FC                   60 	.db #0xFC	; 252
   7B41 FC                   61 	.db #0xFC	; 252
   7B42                      62 _g_tiles3_01:
   7B42 C0                   63 	.db #0xC0	; 192
   7B43 C0                   64 	.db #0xC0	; 192
   7B44 C0                   65 	.db #0xC0	; 192
   7B45 C0                   66 	.db #0xC0	; 192
   7B46 C0                   67 	.db #0xC0	; 192
   7B47 C0                   68 	.db #0xC0	; 192
   7B48 C0                   69 	.db #0xC0	; 192
   7B49 C0                   70 	.db #0xC0	; 192
   7B4A                      71 _g_tiles3_02:
   7B4A C9                   72 	.db #0xC9	; 201
   7B4B C9                   73 	.db #0xC9	; 201
   7B4C C6                   74 	.db #0xC6	; 198
   7B4D C6                   75 	.db #0xC6	; 198
   7B4E C9                   76 	.db #0xC9	; 201
   7B4F C9                   77 	.db #0xC9	; 201
   7B50 C6                   78 	.db #0xC6	; 198
   7B51 C6                   79 	.db #0xC6	; 198
   7B52                      80 _g_tiles3_03:
   7B52 C8                   81 	.db #0xC8	; 200
   7B53 CF                   82 	.db #0xCF	; 207
   7B54 C0                   83 	.db #0xC0	; 192
   7B55 C0                   84 	.db #0xC0	; 192
   7B56 CA                   85 	.db #0xCA	; 202
   7B57 CF                   86 	.db #0xCF	; 207
   7B58 CA                   87 	.db #0xCA	; 202
   7B59 CF                   88 	.db #0xCF	; 207
   7B5A                      89 _g_tiles3_04:
   7B5A CF                   90 	.db #0xCF	; 207
   7B5B C0                   91 	.db #0xC0	; 192
   7B5C C0                   92 	.db #0xC0	; 192
   7B5D C0                   93 	.db #0xC0	; 192
   7B5E CF                   94 	.db #0xCF	; 207
   7B5F C5                   95 	.db #0xC5	; 197
   7B60 CF                   96 	.db #0xCF	; 207
   7B61 C5                   97 	.db #0xC5	; 197
   7B62                      98 _g_tiles3_05:
   7B62 FF                   99 	.db #0xFF	; 255
   7B63 FF                  100 	.db #0xFF	; 255
   7B64 FF                  101 	.db #0xFF	; 255
   7B65 FF                  102 	.db #0xFF	; 255
   7B66 FF                  103 	.db #0xFF	; 255
   7B67 FF                  104 	.db #0xFF	; 255
   7B68 FF                  105 	.db #0xFF	; 255
   7B69 FF                  106 	.db #0xFF	; 255
   7B6A                     107 _g_tiles3_06:
   7B6A CB                  108 	.db #0xCB	; 203
   7B6B CF                  109 	.db #0xCF	; 207
   7B6C C9                  110 	.db #0xC9	; 201
   7B6D C7                  111 	.db #0xC7	; 199
   7B6E CC                  112 	.db #0xCC	; 204
   7B6F C3                  113 	.db #0xC3	; 195
   7B70 CE                  114 	.db #0xCE	; 206
   7B71 CF                  115 	.db #0xCF	; 207
   7B72                     116 _g_tiles3_07:
   7B72 C0                  117 	.db #0xC0	; 192
   7B73 C7                  118 	.db #0xC7	; 199
   7B74 CA                  119 	.db #0xCA	; 202
   7B75 C5                  120 	.db #0xC5	; 197
   7B76 C3                  121 	.db #0xC3	; 195
   7B77 C0                  122 	.db #0xC0	; 192
   7B78 CF                  123 	.db #0xCF	; 207
   7B79 CA                  124 	.db #0xCA	; 202
   7B7A                     125 _g_tiles3_08:
   7B7A CA                  126 	.db #0xCA	; 202
   7B7B CF                  127 	.db #0xCF	; 207
   7B7C CA                  128 	.db #0xCA	; 202
   7B7D CF                  129 	.db #0xCF	; 207
   7B7E C0                  130 	.db #0xC0	; 192
   7B7F C0                  131 	.db #0xC0	; 192
   7B80 C0                  132 	.db #0xC0	; 192
   7B81 CF                  133 	.db #0xCF	; 207
   7B82                     134 _g_tiles3_09:
   7B82 CF                  135 	.db #0xCF	; 207
   7B83 C5                  136 	.db #0xC5	; 197
   7B84 CF                  137 	.db #0xCF	; 207
   7B85 C5                  138 	.db #0xC5	; 197
   7B86 C0                  139 	.db #0xC0	; 192
   7B87 C0                  140 	.db #0xC0	; 192
   7B88 CF                  141 	.db #0xCF	; 207
   7B89 C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
