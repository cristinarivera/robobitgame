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
<<<<<<< HEAD
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
=======
   466A                      54 _g_tileset:
   466A 7E 46                55 	.dw _g_tiles_00
   466C 86 46                56 	.dw _g_tiles_01
   466E 8E 46                57 	.dw _g_tiles_02
   4670 96 46                58 	.dw _g_tiles_03
   4672 9E 46                59 	.dw _g_tiles_04
   4674 A6 46                60 	.dw _g_tiles_05
   4676 AE 46                61 	.dw _g_tiles_06
   4678 B6 46                62 	.dw _g_tiles_07
   467A BE 46                63 	.dw _g_tiles_08
   467C C6 46                64 	.dw _g_tiles_09
   467E                      65 _g_tiles_00:
   467E 03                   66 	.db #0x03	; 3
   467F 03                   67 	.db #0x03	; 3
   4680 42                   68 	.db #0x42	; 66	'B'
   4681 03                   69 	.db #0x03	; 3
   4682 03                   70 	.db #0x03	; 3
   4683 03                   71 	.db #0x03	; 3
   4684 03                   72 	.db #0x03	; 3
   4685 42                   73 	.db #0x42	; 66	'B'
   4686                      74 _g_tiles_01:
   4686 3C                   75 	.db #0x3C	; 60
   4687 3C                   76 	.db #0x3C	; 60
   4688 3C                   77 	.db #0x3C	; 60
   4689 2C                   78 	.db #0x2C	; 44
   468A 3C                   79 	.db #0x3C	; 60
   468B 2C                   80 	.db #0x2C	; 44
   468C 3C                   81 	.db #0x3C	; 60
   468D 3C                   82 	.db #0x3C	; 60
   468E                      83 _g_tiles_02:
   468E 3C                   84 	.db #0x3C	; 60
   468F 3C                   85 	.db #0x3C	; 60
   4690 1C                   86 	.db #0x1C	; 28
   4691 3C                   87 	.db #0x3C	; 60
   4692 1C                   88 	.db #0x1C	; 28
   4693 3C                   89 	.db #0x3C	; 60
   4694 3C                   90 	.db #0x3C	; 60
   4695 3C                   91 	.db #0x3C	; 60
   4696                      92 _g_tiles_03:
   4696 F0                   93 	.db #0xF0	; 240
   4697 3C                   94 	.db #0x3C	; 60
   4698 B4                   95 	.db #0xB4	; 180
   4699 78                   96 	.db #0x78	; 120	'x'
   469A 3C                   97 	.db #0x3C	; 60
   469B 3C                   98 	.db #0x3C	; 60
   469C 78                   99 	.db #0x78	; 120	'x'
   469D 78                  100 	.db #0x78	; 120	'x'
   469E                     101 _g_tiles_04:
   469E 3C                  102 	.db #0x3C	; 60
   469F F0                  103 	.db #0xF0	; 240
   46A0 B4                  104 	.db #0xB4	; 180
   46A1 78                  105 	.db #0x78	; 120	'x'
   46A2 3C                  106 	.db #0x3C	; 60
   46A3 3C                  107 	.db #0x3C	; 60
   46A4 B4                  108 	.db #0xB4	; 180
   46A5 B4                  109 	.db #0xB4	; 180
   46A6                     110 _g_tiles_05:
   46A6 FF                  111 	.db #0xFF	; 255
   46A7 FF                  112 	.db #0xFF	; 255
   46A8 FF                  113 	.db #0xFF	; 255
   46A9 FF                  114 	.db #0xFF	; 255
   46AA FF                  115 	.db #0xFF	; 255
   46AB FF                  116 	.db #0xFF	; 255
   46AC FF                  117 	.db #0xFF	; 255
   46AD FF                  118 	.db #0xFF	; 255
   46AE                     119 _g_tiles_06:
   46AE 3C                  120 	.db #0x3C	; 60
   46AF 3C                  121 	.db #0x3C	; 60
   46B0 3C                  122 	.db #0x3C	; 60
   46B1 2C                  123 	.db #0x2C	; 44
   46B2 3C                  124 	.db #0x3C	; 60
   46B3 2C                  125 	.db #0x2C	; 44
   46B4 3C                  126 	.db #0x3C	; 60
   46B5 3C                  127 	.db #0x3C	; 60
   46B6                     128 _g_tiles_07:
   46B6 3C                  129 	.db #0x3C	; 60
   46B7 3C                  130 	.db #0x3C	; 60
   46B8 1C                  131 	.db #0x1C	; 28
   46B9 3C                  132 	.db #0x3C	; 60
   46BA 1C                  133 	.db #0x1C	; 28
   46BB 3C                  134 	.db #0x3C	; 60
   46BC 3C                  135 	.db #0x3C	; 60
   46BD 3C                  136 	.db #0x3C	; 60
   46BE                     137 _g_tiles_08:
   46BE 78                  138 	.db #0x78	; 120	'x'
   46BF 78                  139 	.db #0x78	; 120	'x'
   46C0 3C                  140 	.db #0x3C	; 60
   46C1 3C                  141 	.db #0x3C	; 60
   46C2 B4                  142 	.db #0xB4	; 180
   46C3 78                  143 	.db #0x78	; 120	'x'
   46C4 F0                  144 	.db #0xF0	; 240
   46C5 3C                  145 	.db #0x3C	; 60
   46C6                     146 _g_tiles_09:
   46C6 B4                  147 	.db #0xB4	; 180
   46C7 B4                  148 	.db #0xB4	; 180
   46C8 3C                  149 	.db #0x3C	; 60
   46C9 3C                  150 	.db #0x3C	; 60
   46CA B4                  151 	.db #0xB4	; 180
   46CB 78                  152 	.db #0x78	; 120	'x'
   46CC 3C                  153 	.db #0x3C	; 60
   46CD F0                  154 	.db #0xF0	; 240
>>>>>>> disparo_principal
                            155 	.area _INITIALIZER
                            156 	.area _CABS (ABS)
