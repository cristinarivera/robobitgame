                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module hero
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_hero
                             12 	.globl _g_palette
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 	.area _CODE
   3E60                      45 _g_palette:
   3E60 54                   46 	.db #0x54	; 84	'T'
   3E61 44                   47 	.db #0x44	; 68	'D'
   3E62 55                   48 	.db #0x55	; 85	'U'
   3E63 5C                   49 	.db #0x5C	; 92
   3E64 4C                   50 	.db #0x4C	; 76	'L'
   3E65 4D                   51 	.db #0x4D	; 77	'M'
   3E66 56                   52 	.db #0x56	; 86	'V'
   3E67 46                   53 	.db #0x46	; 70	'F'
   3E68 57                   54 	.db #0x57	; 87	'W'
   3E69 40                   55 	.db #0x40	; 64
   3E6A 4E                   56 	.db #0x4E	; 78	'N'
   3E6B 52                   57 	.db #0x52	; 82	'R'
   3E6C 53                   58 	.db #0x53	; 83	'S'
   3E6D 4A                   59 	.db #0x4A	; 74	'J'
   3E6E 43                   60 	.db #0x43	; 67	'C'
   3E6F 4B                   61 	.db #0x4B	; 75	'K'
   3E70                      62 _g_hero:
   3E70 44                   63 	.db #0x44	; 68	'D'
   3E71 CC                   64 	.db #0xCC	; 204
   3E72 00                   65 	.db #0x00	; 0
   3E73 00                   66 	.db #0x00	; 0
   3E74 00                   67 	.db #0x00	; 0
   3E75 00                   68 	.db #0x00	; 0
   3E76 00                   69 	.db #0x00	; 0
   3E77 C8                   70 	.db #0xC8	; 200
   3E78 C0                   71 	.db #0xC0	; 192
   3E79 88                   72 	.db #0x88	; 136
   3E7A 00                   73 	.db #0x00	; 0
   3E7B 00                   74 	.db #0x00	; 0
   3E7C 00                   75 	.db #0x00	; 0
   3E7D 00                   76 	.db #0x00	; 0
   3E7E C8                   77 	.db #0xC8	; 200
   3E7F C0                   78 	.db #0xC0	; 192
   3E80 88                   79 	.db #0x88	; 136
   3E81 00                   80 	.db #0x00	; 0
   3E82 00                   81 	.db #0x00	; 0
   3E83 00                   82 	.db #0x00	; 0
   3E84 00                   83 	.db #0x00	; 0
   3E85 CC                   84 	.db #0xCC	; 204
   3E86 CC                   85 	.db #0xCC	; 204
   3E87 88                   86 	.db #0x88	; 136
   3E88 00                   87 	.db #0x00	; 0
   3E89 00                   88 	.db #0x00	; 0
   3E8A 00                   89 	.db #0x00	; 0
   3E8B 00                   90 	.db #0x00	; 0
   3E8C 8D                   91 	.db #0x8D	; 141
   3E8D 0F                   92 	.db #0x0F	; 15
   3E8E 0A                   93 	.db #0x0A	; 10
   3E8F 00                   94 	.db #0x00	; 0
   3E90 00                   95 	.db #0x00	; 0
   3E91 00                   96 	.db #0x00	; 0
   3E92 00                   97 	.db #0x00	; 0
   3E93 8D                   98 	.db #0x8D	; 141
   3E94 4E                   99 	.db #0x4E	; 78	'N'
   3E95 88                  100 	.db #0x88	; 136
   3E96 00                  101 	.db #0x00	; 0
   3E97 00                  102 	.db #0x00	; 0
   3E98 00                  103 	.db #0x00	; 0
   3E99 00                  104 	.db #0x00	; 0
   3E9A 44                  105 	.db #0x44	; 68	'D'
   3E9B C8                  106 	.db #0xC8	; 200
   3E9C 88                  107 	.db #0x88	; 136
   3E9D 00                  108 	.db #0x00	; 0
   3E9E 00                  109 	.db #0x00	; 0
   3E9F 00                  110 	.db #0x00	; 0
   3EA0 00                  111 	.db #0x00	; 0
   3EA1 51                  112 	.db #0x51	; 81	'Q'
   3EA2 CC                  113 	.db #0xCC	; 204
   3EA3 F3                  114 	.db #0xF3	; 243
   3EA4 00                  115 	.db #0x00	; 0
   3EA5 00                  116 	.db #0x00	; 0
   3EA6 00                  117 	.db #0x00	; 0
   3EA7 00                  118 	.db #0x00	; 0
   3EA8 E6                  119 	.db #0xE6	; 230
   3EA9 C0                  120 	.db #0xC0	; 192
   3EAA CC                  121 	.db #0xCC	; 204
   3EAB A2                  122 	.db #0xA2	; 162
   3EAC 00                  123 	.db #0x00	; 0
   3EAD 00                  124 	.db #0x00	; 0
   3EAE 00                  125 	.db #0x00	; 0
   3EAF C8                  126 	.db #0xC8	; 200
   3EB0 C0                  127 	.db #0xC0	; 192
   3EB1 81                  128 	.db #0x81	; 129
   3EB2 03                  129 	.db #0x03	; 3
   3EB3 00                  130 	.db #0x00	; 0
   3EB4 00                  131 	.db #0x00	; 0
   3EB5 00                  132 	.db #0x00	; 0
   3EB6 C8                  133 	.db #0xC8	; 200
   3EB7 C0                  134 	.db #0xC0	; 192
   3EB8 81                  135 	.db #0x81	; 129
   3EB9 CC                  136 	.db #0xCC	; 204
   3EBA 02                  137 	.db #0x02	; 2
   3EBB 00                  138 	.db #0x00	; 0
   3EBC 80                  139 	.db #0x80	; 128
   3EBD C8                  140 	.db #0xC8	; 200
   3EBE 30                  141 	.db #0x30	; 48	'0'
   3EBF 21                  142 	.db #0x21	; 33
   3EC0 03                  143 	.db #0x03	; 3
   3EC1 03                  144 	.db #0x03	; 3
   3EC2 42                  145 	.db #0x42	; 66	'B'
   3EC3 C0                  146 	.db #0xC0	; 192
   3EC4 44                  147 	.db #0x44	; 68	'D'
   3EC5 30                  148 	.db #0x30	; 48	'0'
   3EC6 21                  149 	.db #0x21	; 33
   3EC7 42                  150 	.db #0x42	; 66	'B'
   3EC8 C0                  151 	.db #0xC0	; 192
   3EC9 81                  152 	.db #0x81	; 129
   3ECA 02                  153 	.db #0x02	; 2
   3ECB 00                  154 	.db #0x00	; 0
   3ECC 60                  155 	.db #0x60	; 96
   3ECD C8                  156 	.db #0xC8	; 200
   3ECE C0                  157 	.db #0xC0	; 192
   3ECF C4                  158 	.db #0xC4	; 196
   3ED0 88                  159 	.db #0x88	; 136
   3ED1 00                  160 	.db #0x00	; 0
   3ED2 44                  161 	.db #0x44	; 68	'D'
   3ED3 C8                  162 	.db #0xC8	; 200
   3ED4 88                  163 	.db #0x88	; 136
   3ED5 00                  164 	.db #0x00	; 0
   3ED6 00                  165 	.db #0x00	; 0
   3ED7 00                  166 	.db #0x00	; 0
   3ED8 00                  167 	.db #0x00	; 0
   3ED9 44                  168 	.db #0x44	; 68	'D'
   3EDA C8                  169 	.db #0xC8	; 200
   3EDB CC                  170 	.db #0xCC	; 204
   3EDC 00                  171 	.db #0x00	; 0
   3EDD 00                  172 	.db #0x00	; 0
   3EDE 00                  173 	.db #0x00	; 0
   3EDF 00                  174 	.db #0x00	; 0
   3EE0 44                  175 	.db #0x44	; 68	'D'
   3EE1 C4                  176 	.db #0xC4	; 196
   3EE2 C4                  177 	.db #0xC4	; 196
   3EE3 00                  178 	.db #0x00	; 0
   3EE4 00                  179 	.db #0x00	; 0
   3EE5 00                  180 	.db #0x00	; 0
   3EE6 00                  181 	.db #0x00	; 0
   3EE7 44                  182 	.db #0x44	; 68	'D'
   3EE8 C4                  183 	.db #0xC4	; 196
   3EE9 C4                  184 	.db #0xC4	; 196
   3EEA 00                  185 	.db #0x00	; 0
   3EEB 00                  186 	.db #0x00	; 0
   3EEC 00                  187 	.db #0x00	; 0
   3EED 00                  188 	.db #0x00	; 0
   3EEE 44                  189 	.db #0x44	; 68	'D'
   3EEF C4                  190 	.db #0xC4	; 196
   3EF0 C0                  191 	.db #0xC0	; 192
   3EF1 88                  192 	.db #0x88	; 136
   3EF2 00                  193 	.db #0x00	; 0
   3EF3 00                  194 	.db #0x00	; 0
   3EF4 00                  195 	.db #0x00	; 0
   3EF5 C8                  196 	.db #0xC8	; 200
   3EF6 C4                  197 	.db #0xC4	; 196
   3EF7 C0                  198 	.db #0xC0	; 192
   3EF8 CC                  199 	.db #0xCC	; 204
   3EF9 00                  200 	.db #0x00	; 0
   3EFA 00                  201 	.db #0x00	; 0
   3EFB 00                  202 	.db #0x00	; 0
   3EFC C8                  203 	.db #0xC8	; 200
   3EFD C4                  204 	.db #0xC4	; 196
   3EFE C0                  205 	.db #0xC0	; 192
   3EFF C4                  206 	.db #0xC4	; 196
   3F00 00                  207 	.db #0x00	; 0
   3F01 00                  208 	.db #0x00	; 0
   3F02 00                  209 	.db #0x00	; 0
   3F03 CC                  210 	.db #0xCC	; 204
   3F04 CC                  211 	.db #0xCC	; 204
   3F05 CC                  212 	.db #0xCC	; 204
   3F06 CC                  213 	.db #0xCC	; 204
   3F07 00                  214 	.db #0x00	; 0
   3F08 00                  215 	.db #0x00	; 0
   3F09 00                  216 	.db #0x00	; 0
                            217 	.area _INITIALIZER
                            218 	.area _CABS (ABS)
