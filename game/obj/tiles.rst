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
   54CA                      64 _g_tileset:
   54CA F2 54                65 	.dw _g_tiles_00
   54CC FA 54                66 	.dw _g_tiles_01
   54CE 02 55                67 	.dw _g_tiles_02
   54D0 0A 55                68 	.dw _g_tiles_03
   54D2 12 55                69 	.dw _g_tiles_04
   54D4 1A 55                70 	.dw _g_tiles_05
   54D6 22 55                71 	.dw _g_tiles_06
   54D8 2A 55                72 	.dw _g_tiles_07
   54DA 32 55                73 	.dw _g_tiles_08
   54DC 3A 55                74 	.dw _g_tiles_09
   54DE 42 55                75 	.dw _g_tiles_10
   54E0 4A 55                76 	.dw _g_tiles_11
   54E2 52 55                77 	.dw _g_tiles_12
   54E4 5A 55                78 	.dw _g_tiles_13
   54E6 62 55                79 	.dw _g_tiles_14
   54E8 6A 55                80 	.dw _g_tiles_15
   54EA 72 55                81 	.dw _g_tiles_16
   54EC 7A 55                82 	.dw _g_tiles_17
   54EE 82 55                83 	.dw _g_tiles_18
   54F0 8A 55                84 	.dw _g_tiles_19
   54F2                      85 _g_tiles_00:
   54F2 03                   86 	.db #0x03	; 3
   54F3 03                   87 	.db #0x03	; 3
   54F4 57                   88 	.db #0x57	; 87	'W'
   54F5 03                   89 	.db #0x03	; 3
   54F6 03                   90 	.db #0x03	; 3
   54F7 03                   91 	.db #0x03	; 3
   54F8 03                   92 	.db #0x03	; 3
   54F9 57                   93 	.db #0x57	; 87	'W'
   54FA                      94 _g_tiles_01:
   54FA FC                   95 	.db #0xFC	; 252
   54FB FC                   96 	.db #0xFC	; 252
   54FC FC                   97 	.db #0xFC	; 252
   54FD FC                   98 	.db #0xFC	; 252
   54FE FC                   99 	.db #0xFC	; 252
   54FF FC                  100 	.db #0xFC	; 252
   5500 FC                  101 	.db #0xFC	; 252
   5501 FC                  102 	.db #0xFC	; 252
   5502                     103 _g_tiles_02:
   5502 C3                  104 	.db #0xC3	; 195
   5503 C3                  105 	.db #0xC3	; 195
   5504 C6                  106 	.db #0xC6	; 198
   5505 C3                  107 	.db #0xC3	; 195
   5506 C3                  108 	.db #0xC3	; 195
   5507 C3                  109 	.db #0xC3	; 195
   5508 C3                  110 	.db #0xC3	; 195
   5509 C6                  111 	.db #0xC6	; 198
   550A                     112 _g_tiles_03:
   550A 3C                  113 	.db #0x3C	; 60
   550B FC                  114 	.db #0xFC	; 252
   550C 7C                  115 	.db #0x7C	; 124
   550D BC                  116 	.db #0xBC	; 188
   550E FC                  117 	.db #0xFC	; 252
   550F FC                  118 	.db #0xFC	; 252
   5510 BC                  119 	.db #0xBC	; 188
   5511 BC                  120 	.db #0xBC	; 188
   5512                     121 _g_tiles_04:
   5512 FC                  122 	.db #0xFC	; 252
   5513 3C                  123 	.db #0x3C	; 60
   5514 7C                  124 	.db #0x7C	; 124
   5515 BC                  125 	.db #0xBC	; 188
   5516 FC                  126 	.db #0xFC	; 252
   5517 FC                  127 	.db #0xFC	; 252
   5518 7C                  128 	.db #0x7C	; 124
   5519 7C                  129 	.db #0x7C	; 124
   551A                     130 _g_tiles_05:
   551A FF                  131 	.db #0xFF	; 255
   551B FF                  132 	.db #0xFF	; 255
   551C FF                  133 	.db #0xFF	; 255
   551D FF                  134 	.db #0xFF	; 255
   551E FF                  135 	.db #0xFF	; 255
   551F FF                  136 	.db #0xFF	; 255
   5520 FF                  137 	.db #0xFF	; 255
   5521 FF                  138 	.db #0xFF	; 255
   5522                     139 _g_tiles_06:
   5522 FC                  140 	.db #0xFC	; 252
   5523 FC                  141 	.db #0xFC	; 252
   5524 FC                  142 	.db #0xFC	; 252
   5525 AC                  143 	.db #0xAC	; 172
   5526 FC                  144 	.db #0xFC	; 252
   5527 AC                  145 	.db #0xAC	; 172
   5528 FC                  146 	.db #0xFC	; 252
   5529 FC                  147 	.db #0xFC	; 252
   552A                     148 _g_tiles_07:
   552A FC                  149 	.db #0xFC	; 252
   552B FC                  150 	.db #0xFC	; 252
   552C 5C                  151 	.db #0x5C	; 92
   552D FC                  152 	.db #0xFC	; 252
   552E 5C                  153 	.db #0x5C	; 92
   552F FC                  154 	.db #0xFC	; 252
   5530 FC                  155 	.db #0xFC	; 252
   5531 FC                  156 	.db #0xFC	; 252
   5532                     157 _g_tiles_08:
   5532 BC                  158 	.db #0xBC	; 188
   5533 BC                  159 	.db #0xBC	; 188
   5534 FC                  160 	.db #0xFC	; 252
   5535 FC                  161 	.db #0xFC	; 252
   5536 7C                  162 	.db #0x7C	; 124
   5537 BC                  163 	.db #0xBC	; 188
   5538 3C                  164 	.db #0x3C	; 60
   5539 FC                  165 	.db #0xFC	; 252
   553A                     166 _g_tiles_09:
   553A 7C                  167 	.db #0x7C	; 124
   553B 7C                  168 	.db #0x7C	; 124
   553C FC                  169 	.db #0xFC	; 252
   553D FC                  170 	.db #0xFC	; 252
   553E 7C                  171 	.db #0x7C	; 124
   553F BC                  172 	.db #0xBC	; 188
   5540 FC                  173 	.db #0xFC	; 252
   5541 3C                  174 	.db #0x3C	; 60
   5542                     175 _g_tiles_10:
   5542 FF                  176 	.db #0xFF	; 255
   5543 FF                  177 	.db #0xFF	; 255
   5544 FF                  178 	.db #0xFF	; 255
   5545 FF                  179 	.db #0xFF	; 255
   5546 FF                  180 	.db #0xFF	; 255
   5547 FF                  181 	.db #0xFF	; 255
   5548 FF                  182 	.db #0xFF	; 255
   5549 FF                  183 	.db #0xFF	; 255
   554A                     184 _g_tiles_11:
   554A CC                  185 	.db #0xCC	; 204
   554B CF                  186 	.db #0xCF	; 207
   554C CE                  187 	.db #0xCE	; 206
   554D C9                  188 	.db #0xC9	; 201
   554E CB                  189 	.db #0xCB	; 203
   554F CC                  190 	.db #0xCC	; 204
   5550 CB                  191 	.db #0xCB	; 203
   5551 CE                  192 	.db #0xCE	; 206
   5552                     193 _g_tiles_12:
   5552 CE                  194 	.db #0xCE	; 206
   5553 CD                  195 	.db #0xCD	; 205
   5554 C7                  196 	.db #0xC7	; 199
   5555 CC                  197 	.db #0xCC	; 204
   5556 C3                  198 	.db #0xC3	; 195
   5557 CE                  199 	.db #0xCE	; 206
   5558 C9                  200 	.db #0xC9	; 201
   5559 C7                  201 	.db #0xC7	; 199
   555A                     202 _g_tiles_13:
   555A CC                  203 	.db #0xCC	; 204
   555B CF                  204 	.db #0xCF	; 207
   555C CC                  205 	.db #0xCC	; 204
   555D CC                  206 	.db #0xCC	; 204
   555E CE                  207 	.db #0xCE	; 206
   555F CF                  208 	.db #0xCF	; 207
   5560 CE                  209 	.db #0xCE	; 206
   5561 CF                  210 	.db #0xCF	; 207
   5562                     211 _g_tiles_14:
   5562 CF                  212 	.db #0xCF	; 207
   5563 CC                  213 	.db #0xCC	; 204
   5564 CC                  214 	.db #0xCC	; 204
   5565 CC                  215 	.db #0xCC	; 204
   5566 CF                  216 	.db #0xCF	; 207
   5567 CD                  217 	.db #0xCD	; 205
   5568 CF                  218 	.db #0xCF	; 207
   5569 CD                  219 	.db #0xCD	; 205
   556A                     220 _g_tiles_15:
   556A 0C                  221 	.db #0x0C	; 12
   556B 0C                  222 	.db #0x0C	; 12
   556C 0C                  223 	.db #0x0C	; 12
   556D 0C                  224 	.db #0x0C	; 12
   556E 0C                  225 	.db #0x0C	; 12
   556F 0C                  226 	.db #0x0C	; 12
   5570 0C                  227 	.db #0x0C	; 12
   5571 0C                  228 	.db #0x0C	; 12
   5572                     229 _g_tiles_16:
   5572 CB                  230 	.db #0xCB	; 203
   5573 CF                  231 	.db #0xCF	; 207
   5574 C9                  232 	.db #0xC9	; 201
   5575 C7                  233 	.db #0xC7	; 199
   5576 CC                  234 	.db #0xCC	; 204
   5577 C3                  235 	.db #0xC3	; 195
   5578 CE                  236 	.db #0xCE	; 206
   5579 CF                  237 	.db #0xCF	; 207
   557A                     238 _g_tiles_17:
   557A CC                  239 	.db #0xCC	; 204
   557B C7                  240 	.db #0xC7	; 199
   557C CE                  241 	.db #0xCE	; 206
   557D CD                  242 	.db #0xCD	; 205
   557E C3                  243 	.db #0xC3	; 195
   557F CC                  244 	.db #0xCC	; 204
   5580 CF                  245 	.db #0xCF	; 207
   5581 CE                  246 	.db #0xCE	; 206
   5582                     247 _g_tiles_18:
   5582 CE                  248 	.db #0xCE	; 206
   5583 CF                  249 	.db #0xCF	; 207
   5584 CE                  250 	.db #0xCE	; 206
   5585 CF                  251 	.db #0xCF	; 207
   5586 CC                  252 	.db #0xCC	; 204
   5587 CC                  253 	.db #0xCC	; 204
   5588 CC                  254 	.db #0xCC	; 204
   5589 CF                  255 	.db #0xCF	; 207
   558A                     256 _g_tiles_19:
   558A CF                  257 	.db #0xCF	; 207
   558B CD                  258 	.db #0xCD	; 205
   558C CF                  259 	.db #0xCF	; 207
   558D CD                  260 	.db #0xCD	; 205
   558E CC                  261 	.db #0xCC	; 204
   558F CC                  262 	.db #0xCC	; 204
   5590 CF                  263 	.db #0xCF	; 207
   5591 CC                  264 	.db #0xCC	; 204
                            265 	.area _INITIALIZER
                            266 	.area _CABS (ABS)
