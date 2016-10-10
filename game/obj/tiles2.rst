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
   577A                      53 _g_tiles2_00:
   577A C3                   54 	.db #0xC3	; 195
   577B C3                   55 	.db #0xC3	; 195
   577C C6                   56 	.db #0xC6	; 198
   577D C3                   57 	.db #0xC3	; 195
   577E C3                   58 	.db #0xC3	; 195
   577F C3                   59 	.db #0xC3	; 195
   5780 C3                   60 	.db #0xC3	; 195
   5781 C6                   61 	.db #0xC6	; 198
   5782                      62 _g_tiles2_01:
   5782 CC                   63 	.db #0xCC	; 204
   5783 CF                   64 	.db #0xCF	; 207
   5784 CE                   65 	.db #0xCE	; 206
   5785 C9                   66 	.db #0xC9	; 201
   5786 CB                   67 	.db #0xCB	; 203
   5787 CC                   68 	.db #0xCC	; 204
   5788 CB                   69 	.db #0xCB	; 203
   5789 CE                   70 	.db #0xCE	; 206
   578A                      71 _g_tiles2_02:
   578A CE                   72 	.db #0xCE	; 206
   578B CD                   73 	.db #0xCD	; 205
   578C C7                   74 	.db #0xC7	; 199
   578D CC                   75 	.db #0xCC	; 204
   578E C3                   76 	.db #0xC3	; 195
   578F CE                   77 	.db #0xCE	; 206
   5790 C9                   78 	.db #0xC9	; 201
   5791 C7                   79 	.db #0xC7	; 199
   5792                      80 _g_tiles2_03:
   5792 CC                   81 	.db #0xCC	; 204
   5793 CF                   82 	.db #0xCF	; 207
   5794 CC                   83 	.db #0xCC	; 204
   5795 CC                   84 	.db #0xCC	; 204
   5796 CE                   85 	.db #0xCE	; 206
   5797 CF                   86 	.db #0xCF	; 207
   5798 CE                   87 	.db #0xCE	; 206
   5799 CF                   88 	.db #0xCF	; 207
   579A                      89 _g_tiles2_04:
   579A CF                   90 	.db #0xCF	; 207
   579B CC                   91 	.db #0xCC	; 204
   579C CC                   92 	.db #0xCC	; 204
   579D CC                   93 	.db #0xCC	; 204
   579E CF                   94 	.db #0xCF	; 207
   579F CD                   95 	.db #0xCD	; 205
   57A0 CF                   96 	.db #0xCF	; 207
   57A1 CD                   97 	.db #0xCD	; 205
   57A2                      98 _g_tiles2_05:
   57A2 FF                   99 	.db #0xFF	; 255
   57A3 FF                  100 	.db #0xFF	; 255
   57A4 FF                  101 	.db #0xFF	; 255
   57A5 FF                  102 	.db #0xFF	; 255
   57A6 FF                  103 	.db #0xFF	; 255
   57A7 FF                  104 	.db #0xFF	; 255
   57A8 FF                  105 	.db #0xFF	; 255
   57A9 FF                  106 	.db #0xFF	; 255
   57AA                     107 _g_tiles2_06:
   57AA CB                  108 	.db #0xCB	; 203
   57AB CF                  109 	.db #0xCF	; 207
   57AC C9                  110 	.db #0xC9	; 201
   57AD C7                  111 	.db #0xC7	; 199
   57AE CC                  112 	.db #0xCC	; 204
   57AF C3                  113 	.db #0xC3	; 195
   57B0 CE                  114 	.db #0xCE	; 206
   57B1 CF                  115 	.db #0xCF	; 207
   57B2                     116 _g_tiles2_07:
   57B2 CC                  117 	.db #0xCC	; 204
   57B3 C7                  118 	.db #0xC7	; 199
   57B4 CE                  119 	.db #0xCE	; 206
   57B5 CD                  120 	.db #0xCD	; 205
   57B6 C3                  121 	.db #0xC3	; 195
   57B7 CC                  122 	.db #0xCC	; 204
   57B8 CF                  123 	.db #0xCF	; 207
   57B9 CE                  124 	.db #0xCE	; 206
   57BA                     125 _g_tiles2_08:
   57BA CE                  126 	.db #0xCE	; 206
   57BB CF                  127 	.db #0xCF	; 207
   57BC CE                  128 	.db #0xCE	; 206
   57BD CF                  129 	.db #0xCF	; 207
   57BE CC                  130 	.db #0xCC	; 204
   57BF CC                  131 	.db #0xCC	; 204
   57C0 CC                  132 	.db #0xCC	; 204
   57C1 CF                  133 	.db #0xCF	; 207
   57C2                     134 _g_tiles2_09:
   57C2 CF                  135 	.db #0xCF	; 207
   57C3 CD                  136 	.db #0xCD	; 205
   57C4 CF                  137 	.db #0xCF	; 207
   57C5 CD                  138 	.db #0xCD	; 205
   57C6 CC                  139 	.db #0xCC	; 204
   57C7 CC                  140 	.db #0xCC	; 204
   57C8 CF                  141 	.db #0xCF	; 207
   57C9 CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
