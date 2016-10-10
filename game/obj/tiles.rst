                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tiles
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tiles_19
                             12 	.globl _g_tiles_18
                             13 	.globl _g_tiles_17
                             14 	.globl _g_tiles_16
                             15 	.globl _g_tiles_15
                             16 	.globl _g_tiles_14
                             17 	.globl _g_tiles_13
                             18 	.globl _g_tiles_12
                             19 	.globl _g_tiles_11
                             20 	.globl _g_tiles_10
                             21 	.globl _g_tiles_09
                             22 	.globl _g_tiles_08
                             23 	.globl _g_tiles_07
                             24 	.globl _g_tiles_06
                             25 	.globl _g_tiles_05
                             26 	.globl _g_tiles_04
                             27 	.globl _g_tiles_03
                             28 	.globl _g_tiles_02
                             29 	.globl _g_tiles_01
                             30 	.globl _g_tiles_00
                             31 	.globl _g_tileset
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 	.area _CODE
   54E0                      64 _g_tileset:
   54E0 08 55                65 	.dw _g_tiles_00
   54E2 10 55                66 	.dw _g_tiles_01
   54E4 18 55                67 	.dw _g_tiles_02
   54E6 20 55                68 	.dw _g_tiles_03
   54E8 28 55                69 	.dw _g_tiles_04
   54EA 30 55                70 	.dw _g_tiles_05
   54EC 38 55                71 	.dw _g_tiles_06
   54EE 40 55                72 	.dw _g_tiles_07
   54F0 48 55                73 	.dw _g_tiles_08
   54F2 50 55                74 	.dw _g_tiles_09
   54F4 58 55                75 	.dw _g_tiles_10
   54F6 60 55                76 	.dw _g_tiles_11
   54F8 68 55                77 	.dw _g_tiles_12
   54FA 70 55                78 	.dw _g_tiles_13
   54FC 78 55                79 	.dw _g_tiles_14
   54FE 80 55                80 	.dw _g_tiles_15
   5500 88 55                81 	.dw _g_tiles_16
   5502 90 55                82 	.dw _g_tiles_17
   5504 98 55                83 	.dw _g_tiles_18
   5506 A0 55                84 	.dw _g_tiles_19
   5508                      85 _g_tiles_00:
   5508 03                   86 	.db #0x03	; 3
   5509 03                   87 	.db #0x03	; 3
   550A 57                   88 	.db #0x57	; 87	'W'
   550B 03                   89 	.db #0x03	; 3
   550C 03                   90 	.db #0x03	; 3
   550D 03                   91 	.db #0x03	; 3
   550E 03                   92 	.db #0x03	; 3
   550F 57                   93 	.db #0x57	; 87	'W'
   5510                      94 _g_tiles_01:
   5510 FC                   95 	.db #0xFC	; 252
   5511 FC                   96 	.db #0xFC	; 252
   5512 FC                   97 	.db #0xFC	; 252
   5513 FC                   98 	.db #0xFC	; 252
   5514 FC                   99 	.db #0xFC	; 252
   5515 FC                  100 	.db #0xFC	; 252
   5516 FC                  101 	.db #0xFC	; 252
   5517 FC                  102 	.db #0xFC	; 252
   5518                     103 _g_tiles_02:
   5518 C3                  104 	.db #0xC3	; 195
   5519 C3                  105 	.db #0xC3	; 195
   551A C6                  106 	.db #0xC6	; 198
   551B C3                  107 	.db #0xC3	; 195
   551C C3                  108 	.db #0xC3	; 195
   551D C3                  109 	.db #0xC3	; 195
   551E C3                  110 	.db #0xC3	; 195
   551F C6                  111 	.db #0xC6	; 198
   5520                     112 _g_tiles_03:
   5520 3C                  113 	.db #0x3C	; 60
   5521 FC                  114 	.db #0xFC	; 252
   5522 7C                  115 	.db #0x7C	; 124
   5523 BC                  116 	.db #0xBC	; 188
   5524 FC                  117 	.db #0xFC	; 252
   5525 FC                  118 	.db #0xFC	; 252
   5526 BC                  119 	.db #0xBC	; 188
   5527 BC                  120 	.db #0xBC	; 188
   5528                     121 _g_tiles_04:
   5528 FC                  122 	.db #0xFC	; 252
   5529 3C                  123 	.db #0x3C	; 60
   552A 7C                  124 	.db #0x7C	; 124
   552B BC                  125 	.db #0xBC	; 188
   552C FC                  126 	.db #0xFC	; 252
   552D FC                  127 	.db #0xFC	; 252
   552E 7C                  128 	.db #0x7C	; 124
   552F 7C                  129 	.db #0x7C	; 124
   5530                     130 _g_tiles_05:
   5530 FF                  131 	.db #0xFF	; 255
   5531 FF                  132 	.db #0xFF	; 255
   5532 FF                  133 	.db #0xFF	; 255
   5533 FF                  134 	.db #0xFF	; 255
   5534 FF                  135 	.db #0xFF	; 255
   5535 FF                  136 	.db #0xFF	; 255
   5536 FF                  137 	.db #0xFF	; 255
   5537 FF                  138 	.db #0xFF	; 255
   5538                     139 _g_tiles_06:
   5538 FC                  140 	.db #0xFC	; 252
   5539 FC                  141 	.db #0xFC	; 252
   553A FC                  142 	.db #0xFC	; 252
   553B AC                  143 	.db #0xAC	; 172
   553C FC                  144 	.db #0xFC	; 252
   553D AC                  145 	.db #0xAC	; 172
   553E FC                  146 	.db #0xFC	; 252
   553F FC                  147 	.db #0xFC	; 252
   5540                     148 _g_tiles_07:
   5540 FC                  149 	.db #0xFC	; 252
   5541 FC                  150 	.db #0xFC	; 252
   5542 5C                  151 	.db #0x5C	; 92
   5543 FC                  152 	.db #0xFC	; 252
   5544 5C                  153 	.db #0x5C	; 92
   5545 FC                  154 	.db #0xFC	; 252
   5546 FC                  155 	.db #0xFC	; 252
   5547 FC                  156 	.db #0xFC	; 252
   5548                     157 _g_tiles_08:
   5548 BC                  158 	.db #0xBC	; 188
   5549 BC                  159 	.db #0xBC	; 188
   554A FC                  160 	.db #0xFC	; 252
   554B FC                  161 	.db #0xFC	; 252
   554C 7C                  162 	.db #0x7C	; 124
   554D BC                  163 	.db #0xBC	; 188
   554E 3C                  164 	.db #0x3C	; 60
   554F FC                  165 	.db #0xFC	; 252
   5550                     166 _g_tiles_09:
   5550 7C                  167 	.db #0x7C	; 124
   5551 7C                  168 	.db #0x7C	; 124
   5552 FC                  169 	.db #0xFC	; 252
   5553 FC                  170 	.db #0xFC	; 252
   5554 7C                  171 	.db #0x7C	; 124
   5555 BC                  172 	.db #0xBC	; 188
   5556 FC                  173 	.db #0xFC	; 252
   5557 3C                  174 	.db #0x3C	; 60
   5558                     175 _g_tiles_10:
   5558 FF                  176 	.db #0xFF	; 255
   5559 FF                  177 	.db #0xFF	; 255
   555A FF                  178 	.db #0xFF	; 255
   555B FF                  179 	.db #0xFF	; 255
   555C FF                  180 	.db #0xFF	; 255
   555D FF                  181 	.db #0xFF	; 255
   555E FF                  182 	.db #0xFF	; 255
   555F FF                  183 	.db #0xFF	; 255
   5560                     184 _g_tiles_11:
   5560 CC                  185 	.db #0xCC	; 204
   5561 CF                  186 	.db #0xCF	; 207
   5562 CE                  187 	.db #0xCE	; 206
   5563 C9                  188 	.db #0xC9	; 201
   5564 CB                  189 	.db #0xCB	; 203
   5565 CC                  190 	.db #0xCC	; 204
   5566 CB                  191 	.db #0xCB	; 203
   5567 CE                  192 	.db #0xCE	; 206
   5568                     193 _g_tiles_12:
   5568 CE                  194 	.db #0xCE	; 206
   5569 CD                  195 	.db #0xCD	; 205
   556A C7                  196 	.db #0xC7	; 199
   556B CC                  197 	.db #0xCC	; 204
   556C C3                  198 	.db #0xC3	; 195
   556D CE                  199 	.db #0xCE	; 206
   556E C9                  200 	.db #0xC9	; 201
   556F C7                  201 	.db #0xC7	; 199
   5570                     202 _g_tiles_13:
   5570 CC                  203 	.db #0xCC	; 204
   5571 CF                  204 	.db #0xCF	; 207
   5572 CC                  205 	.db #0xCC	; 204
   5573 CC                  206 	.db #0xCC	; 204
   5574 CE                  207 	.db #0xCE	; 206
   5575 CF                  208 	.db #0xCF	; 207
   5576 CE                  209 	.db #0xCE	; 206
   5577 CF                  210 	.db #0xCF	; 207
   5578                     211 _g_tiles_14:
   5578 CF                  212 	.db #0xCF	; 207
   5579 CC                  213 	.db #0xCC	; 204
   557A CC                  214 	.db #0xCC	; 204
   557B CC                  215 	.db #0xCC	; 204
   557C CF                  216 	.db #0xCF	; 207
   557D CD                  217 	.db #0xCD	; 205
   557E CF                  218 	.db #0xCF	; 207
   557F CD                  219 	.db #0xCD	; 205
   5580                     220 _g_tiles_15:
   5580 0C                  221 	.db #0x0C	; 12
   5581 0C                  222 	.db #0x0C	; 12
   5582 0C                  223 	.db #0x0C	; 12
   5583 0C                  224 	.db #0x0C	; 12
   5584 0C                  225 	.db #0x0C	; 12
   5585 0C                  226 	.db #0x0C	; 12
   5586 0C                  227 	.db #0x0C	; 12
   5587 0C                  228 	.db #0x0C	; 12
   5588                     229 _g_tiles_16:
   5588 CB                  230 	.db #0xCB	; 203
   5589 CF                  231 	.db #0xCF	; 207
   558A C9                  232 	.db #0xC9	; 201
   558B C7                  233 	.db #0xC7	; 199
   558C CC                  234 	.db #0xCC	; 204
   558D C3                  235 	.db #0xC3	; 195
   558E CE                  236 	.db #0xCE	; 206
   558F CF                  237 	.db #0xCF	; 207
   5590                     238 _g_tiles_17:
   5590 CC                  239 	.db #0xCC	; 204
   5591 C7                  240 	.db #0xC7	; 199
   5592 CE                  241 	.db #0xCE	; 206
   5593 CD                  242 	.db #0xCD	; 205
   5594 C3                  243 	.db #0xC3	; 195
   5595 CC                  244 	.db #0xCC	; 204
   5596 CF                  245 	.db #0xCF	; 207
   5597 CE                  246 	.db #0xCE	; 206
   5598                     247 _g_tiles_18:
   5598 CE                  248 	.db #0xCE	; 206
   5599 CF                  249 	.db #0xCF	; 207
   559A CE                  250 	.db #0xCE	; 206
   559B CF                  251 	.db #0xCF	; 207
   559C CC                  252 	.db #0xCC	; 204
   559D CC                  253 	.db #0xCC	; 204
   559E CC                  254 	.db #0xCC	; 204
   559F CF                  255 	.db #0xCF	; 207
   55A0                     256 _g_tiles_19:
   55A0 CF                  257 	.db #0xCF	; 207
   55A1 CD                  258 	.db #0xCD	; 205
   55A2 CF                  259 	.db #0xCF	; 207
   55A3 CD                  260 	.db #0xCD	; 205
   55A4 CC                  261 	.db #0xCC	; 204
   55A5 CC                  262 	.db #0xCC	; 204
   55A6 CF                  263 	.db #0xCF	; 207
   55A7 CC                  264 	.db #0xCC	; 204
                            265 	.area _INITIALIZER
                            266 	.area _CABS (ABS)
