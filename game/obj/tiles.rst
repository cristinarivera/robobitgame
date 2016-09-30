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
   46E0                      54 _g_tileset:
   46E0 F4 46                55 	.dw _g_tiles_00
   46E2 FC 46                56 	.dw _g_tiles_01
   46E4 04 47                57 	.dw _g_tiles_02
   46E6 0C 47                58 	.dw _g_tiles_03
   46E8 14 47                59 	.dw _g_tiles_04
   46EA 1C 47                60 	.dw _g_tiles_05
   46EC 24 47                61 	.dw _g_tiles_06
   46EE 2C 47                62 	.dw _g_tiles_07
   46F0 34 47                63 	.dw _g_tiles_08
   46F2 3C 47                64 	.dw _g_tiles_09
   46F4                      65 _g_tiles_00:
   46F4 03                   66 	.db #0x03	; 3
   46F5 03                   67 	.db #0x03	; 3
   46F6 42                   68 	.db #0x42	; 66	'B'
   46F7 03                   69 	.db #0x03	; 3
   46F8 03                   70 	.db #0x03	; 3
   46F9 03                   71 	.db #0x03	; 3
   46FA 03                   72 	.db #0x03	; 3
   46FB 42                   73 	.db #0x42	; 66	'B'
   46FC                      74 _g_tiles_01:
   46FC FC                   75 	.db #0xFC	; 252
   46FD FC                   76 	.db #0xFC	; 252
   46FE FC                   77 	.db #0xFC	; 252
   46FF AC                   78 	.db #0xAC	; 172
   4700 FC                   79 	.db #0xFC	; 252
   4701 AC                   80 	.db #0xAC	; 172
   4702 FC                   81 	.db #0xFC	; 252
   4703 FC                   82 	.db #0xFC	; 252
   4704                      83 _g_tiles_02:
   4704 FC                   84 	.db #0xFC	; 252
   4705 FC                   85 	.db #0xFC	; 252
   4706 5C                   86 	.db #0x5C	; 92
   4707 FC                   87 	.db #0xFC	; 252
   4708 5C                   88 	.db #0x5C	; 92
   4709 FC                   89 	.db #0xFC	; 252
   470A FC                   90 	.db #0xFC	; 252
   470B FC                   91 	.db #0xFC	; 252
   470C                      92 _g_tiles_03:
   470C 3C                   93 	.db #0x3C	; 60
   470D FC                   94 	.db #0xFC	; 252
   470E 7C                   95 	.db #0x7C	; 124
   470F BC                   96 	.db #0xBC	; 188
   4710 FC                   97 	.db #0xFC	; 252
   4711 FC                   98 	.db #0xFC	; 252
   4712 BC                   99 	.db #0xBC	; 188
   4713 BC                  100 	.db #0xBC	; 188
   4714                     101 _g_tiles_04:
   4714 FC                  102 	.db #0xFC	; 252
   4715 3C                  103 	.db #0x3C	; 60
   4716 7C                  104 	.db #0x7C	; 124
   4717 BC                  105 	.db #0xBC	; 188
   4718 FC                  106 	.db #0xFC	; 252
   4719 FC                  107 	.db #0xFC	; 252
   471A 7C                  108 	.db #0x7C	; 124
   471B 7C                  109 	.db #0x7C	; 124
   471C                     110 _g_tiles_05:
   471C FF                  111 	.db #0xFF	; 255
   471D FF                  112 	.db #0xFF	; 255
   471E FF                  113 	.db #0xFF	; 255
   471F FF                  114 	.db #0xFF	; 255
   4720 FF                  115 	.db #0xFF	; 255
   4721 FF                  116 	.db #0xFF	; 255
   4722 FF                  117 	.db #0xFF	; 255
   4723 FF                  118 	.db #0xFF	; 255
   4724                     119 _g_tiles_06:
   4724 FC                  120 	.db #0xFC	; 252
   4725 FC                  121 	.db #0xFC	; 252
   4726 FC                  122 	.db #0xFC	; 252
   4727 AC                  123 	.db #0xAC	; 172
   4728 FC                  124 	.db #0xFC	; 252
   4729 AC                  125 	.db #0xAC	; 172
   472A FC                  126 	.db #0xFC	; 252
   472B FC                  127 	.db #0xFC	; 252
   472C                     128 _g_tiles_07:
   472C FC                  129 	.db #0xFC	; 252
   472D FC                  130 	.db #0xFC	; 252
   472E 5C                  131 	.db #0x5C	; 92
   472F FC                  132 	.db #0xFC	; 252
   4730 5C                  133 	.db #0x5C	; 92
   4731 FC                  134 	.db #0xFC	; 252
   4732 FC                  135 	.db #0xFC	; 252
   4733 FC                  136 	.db #0xFC	; 252
   4734                     137 _g_tiles_08:
   4734 BC                  138 	.db #0xBC	; 188
   4735 BC                  139 	.db #0xBC	; 188
   4736 FC                  140 	.db #0xFC	; 252
   4737 FC                  141 	.db #0xFC	; 252
   4738 7C                  142 	.db #0x7C	; 124
   4739 BC                  143 	.db #0xBC	; 188
   473A 3C                  144 	.db #0x3C	; 60
   473B FC                  145 	.db #0xFC	; 252
   473C                     146 _g_tiles_09:
   473C 7C                  147 	.db #0x7C	; 124
   473D 7C                  148 	.db #0x7C	; 124
   473E FC                  149 	.db #0xFC	; 252
   473F FC                  150 	.db #0xFC	; 252
   4740 7C                  151 	.db #0x7C	; 124
   4741 BC                  152 	.db #0xBC	; 188
   4742 FC                  153 	.db #0xFC	; 252
   4743 3C                  154 	.db #0x3C	; 60
                            155 	.area _INITIALIZER
                            156 	.area _CABS (ABS)
