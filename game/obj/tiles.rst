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
                             11 	.globl _g_tiles_09
                             12 	.globl _g_tiles_08
                             13 	.globl _g_tiles_07
                             14 	.globl _g_tiles_06
                             15 	.globl _g_tiles_05
                             16 	.globl _g_tiles_04
                             17 	.globl _g_tiles_03
                             18 	.globl _g_tiles_02
                             19 	.globl _g_tiles_01
                             20 	.globl _g_tiles_00
                             21 	.globl _g_tileset
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 	.area _CODE
   470A                      54 _g_tileset:
   470A 1E 47                55 	.dw _g_tiles_00
   470C 26 47                56 	.dw _g_tiles_01
   470E 2E 47                57 	.dw _g_tiles_02
   4710 36 47                58 	.dw _g_tiles_03
   4712 3E 47                59 	.dw _g_tiles_04
   4714 46 47                60 	.dw _g_tiles_05
   4716 4E 47                61 	.dw _g_tiles_06
   4718 56 47                62 	.dw _g_tiles_07
   471A 5E 47                63 	.dw _g_tiles_08
   471C 66 47                64 	.dw _g_tiles_09
   471E                      65 _g_tiles_00:
   471E 03                   66 	.db #0x03	; 3
   471F 03                   67 	.db #0x03	; 3
   4720 42                   68 	.db #0x42	; 66	'B'
   4721 03                   69 	.db #0x03	; 3
   4722 03                   70 	.db #0x03	; 3
   4723 03                   71 	.db #0x03	; 3
   4724 03                   72 	.db #0x03	; 3
   4725 42                   73 	.db #0x42	; 66	'B'
   4726                      74 _g_tiles_01:
   4726 FC                   75 	.db #0xFC	; 252
   4727 FC                   76 	.db #0xFC	; 252
   4728 FC                   77 	.db #0xFC	; 252
   4729 AC                   78 	.db #0xAC	; 172
   472A FC                   79 	.db #0xFC	; 252
   472B AC                   80 	.db #0xAC	; 172
   472C FC                   81 	.db #0xFC	; 252
   472D FC                   82 	.db #0xFC	; 252
   472E                      83 _g_tiles_02:
   472E FC                   84 	.db #0xFC	; 252
   472F FC                   85 	.db #0xFC	; 252
   4730 5C                   86 	.db #0x5C	; 92
   4731 FC                   87 	.db #0xFC	; 252
   4732 5C                   88 	.db #0x5C	; 92
   4733 FC                   89 	.db #0xFC	; 252
   4734 FC                   90 	.db #0xFC	; 252
   4735 FC                   91 	.db #0xFC	; 252
   4736                      92 _g_tiles_03:
   4736 3C                   93 	.db #0x3C	; 60
   4737 FC                   94 	.db #0xFC	; 252
   4738 7C                   95 	.db #0x7C	; 124
   4739 BC                   96 	.db #0xBC	; 188
   473A FC                   97 	.db #0xFC	; 252
   473B FC                   98 	.db #0xFC	; 252
   473C BC                   99 	.db #0xBC	; 188
   473D BC                  100 	.db #0xBC	; 188
   473E                     101 _g_tiles_04:
   473E FC                  102 	.db #0xFC	; 252
   473F 3C                  103 	.db #0x3C	; 60
   4740 7C                  104 	.db #0x7C	; 124
   4741 BC                  105 	.db #0xBC	; 188
   4742 FC                  106 	.db #0xFC	; 252
   4743 FC                  107 	.db #0xFC	; 252
   4744 7C                  108 	.db #0x7C	; 124
   4745 7C                  109 	.db #0x7C	; 124
   4746                     110 _g_tiles_05:
   4746 FF                  111 	.db #0xFF	; 255
   4747 FF                  112 	.db #0xFF	; 255
   4748 FF                  113 	.db #0xFF	; 255
   4749 FF                  114 	.db #0xFF	; 255
   474A FF                  115 	.db #0xFF	; 255
   474B FF                  116 	.db #0xFF	; 255
   474C FF                  117 	.db #0xFF	; 255
   474D FF                  118 	.db #0xFF	; 255
   474E                     119 _g_tiles_06:
   474E FC                  120 	.db #0xFC	; 252
   474F FC                  121 	.db #0xFC	; 252
   4750 FC                  122 	.db #0xFC	; 252
   4751 AC                  123 	.db #0xAC	; 172
   4752 FC                  124 	.db #0xFC	; 252
   4753 AC                  125 	.db #0xAC	; 172
   4754 FC                  126 	.db #0xFC	; 252
   4755 FC                  127 	.db #0xFC	; 252
   4756                     128 _g_tiles_07:
   4756 FC                  129 	.db #0xFC	; 252
   4757 FC                  130 	.db #0xFC	; 252
   4758 5C                  131 	.db #0x5C	; 92
   4759 FC                  132 	.db #0xFC	; 252
   475A 5C                  133 	.db #0x5C	; 92
   475B FC                  134 	.db #0xFC	; 252
   475C FC                  135 	.db #0xFC	; 252
   475D FC                  136 	.db #0xFC	; 252
   475E                     137 _g_tiles_08:
   475E BC                  138 	.db #0xBC	; 188
   475F BC                  139 	.db #0xBC	; 188
   4760 FC                  140 	.db #0xFC	; 252
   4761 FC                  141 	.db #0xFC	; 252
   4762 7C                  142 	.db #0x7C	; 124
   4763 BC                  143 	.db #0xBC	; 188
   4764 3C                  144 	.db #0x3C	; 60
   4765 FC                  145 	.db #0xFC	; 252
   4766                     146 _g_tiles_09:
   4766 7C                  147 	.db #0x7C	; 124
   4767 7C                  148 	.db #0x7C	; 124
   4768 FC                  149 	.db #0xFC	; 252
   4769 FC                  150 	.db #0xFC	; 252
   476A 7C                  151 	.db #0x7C	; 124
   476B BC                  152 	.db #0xBC	; 188
   476C FC                  153 	.db #0xFC	; 252
   476D 3C                  154 	.db #0x3C	; 60
                            155 	.area _INITIALIZER
                            156 	.area _CABS (ABS)
