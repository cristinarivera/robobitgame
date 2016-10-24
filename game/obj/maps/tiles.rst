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
   49E0                      64 _g_tileset:
   49E0 08 4A                65 	.dw _g_tiles_00
   49E2 10 4A                66 	.dw _g_tiles_01
   49E4 18 4A                67 	.dw _g_tiles_02
   49E6 20 4A                68 	.dw _g_tiles_03
   49E8 28 4A                69 	.dw _g_tiles_04
   49EA 30 4A                70 	.dw _g_tiles_05
   49EC 38 4A                71 	.dw _g_tiles_06
   49EE 40 4A                72 	.dw _g_tiles_07
   49F0 48 4A                73 	.dw _g_tiles_08
   49F2 50 4A                74 	.dw _g_tiles_09
   49F4 58 4A                75 	.dw _g_tiles_10
   49F6 60 4A                76 	.dw _g_tiles_11
   49F8 68 4A                77 	.dw _g_tiles_12
   49FA 70 4A                78 	.dw _g_tiles_13
   49FC 78 4A                79 	.dw _g_tiles_14
   49FE 80 4A                80 	.dw _g_tiles_15
   4A00 88 4A                81 	.dw _g_tiles_16
   4A02 90 4A                82 	.dw _g_tiles_17
   4A04 98 4A                83 	.dw _g_tiles_18
   4A06 A0 4A                84 	.dw _g_tiles_19
   4A08                      85 _g_tiles_00:
   4A08 C3                   86 	.db #0xC3	; 195
   4A09 C3                   87 	.db #0xC3	; 195
   4A0A D7                   88 	.db #0xD7	; 215
   4A0B C3                   89 	.db #0xC3	; 195
   4A0C C3                   90 	.db #0xC3	; 195
   4A0D C3                   91 	.db #0xC3	; 195
   4A0E C3                   92 	.db #0xC3	; 195
   4A0F D7                   93 	.db #0xD7	; 215
   4A10                      94 _g_tiles_01:
   4A10 03                   95 	.db #0x03	; 3
   4A11 03                   96 	.db #0x03	; 3
   4A12 03                   97 	.db #0x03	; 3
   4A13 03                   98 	.db #0x03	; 3
   4A14 03                   99 	.db #0x03	; 3
   4A15 03                  100 	.db #0x03	; 3
   4A16 03                  101 	.db #0x03	; 3
   4A17 03                  102 	.db #0x03	; 3
   4A18                     103 _g_tiles_02:
   4A18 0F                  104 	.db #0x0F	; 15
   4A19 0F                  105 	.db #0x0F	; 15
   4A1A 4E                  106 	.db #0x4E	; 78	'N'
   4A1B 0F                  107 	.db #0x0F	; 15
   4A1C 0F                  108 	.db #0x0F	; 15
   4A1D 0F                  109 	.db #0x0F	; 15
   4A1E 0F                  110 	.db #0x0F	; 15
   4A1F 4E                  111 	.db #0x4E	; 78	'N'
   4A20                     112 _g_tiles_03:
   4A20 FC                  113 	.db #0xFC	; 252
   4A21 03                  114 	.db #0x03	; 3
   4A22 A9                  115 	.db #0xA9	; 169
   4A23 56                  116 	.db #0x56	; 86	'V'
   4A24 03                  117 	.db #0x03	; 3
   4A25 03                  118 	.db #0x03	; 3
   4A26 56                  119 	.db #0x56	; 86	'V'
   4A27 56                  120 	.db #0x56	; 86	'V'
   4A28                     121 _g_tiles_04:
   4A28 03                  122 	.db #0x03	; 3
   4A29 FC                  123 	.db #0xFC	; 252
   4A2A A9                  124 	.db #0xA9	; 169
   4A2B 56                  125 	.db #0x56	; 86	'V'
   4A2C 03                  126 	.db #0x03	; 3
   4A2D 03                  127 	.db #0x03	; 3
   4A2E A9                  128 	.db #0xA9	; 169
   4A2F A9                  129 	.db #0xA9	; 169
   4A30                     130 _g_tiles_05:
   4A30 FF                  131 	.db #0xFF	; 255
   4A31 FF                  132 	.db #0xFF	; 255
   4A32 FF                  133 	.db #0xFF	; 255
   4A33 FF                  134 	.db #0xFF	; 255
   4A34 FF                  135 	.db #0xFF	; 255
   4A35 FF                  136 	.db #0xFF	; 255
   4A36 FF                  137 	.db #0xFF	; 255
   4A37 FF                  138 	.db #0xFF	; 255
   4A38                     139 _g_tiles_06:
   4A38 03                  140 	.db #0x03	; 3
   4A39 03                  141 	.db #0x03	; 3
   4A3A 03                  142 	.db #0x03	; 3
   4A3B 06                  143 	.db #0x06	; 6
   4A3C 03                  144 	.db #0x03	; 3
   4A3D 06                  145 	.db #0x06	; 6
   4A3E 03                  146 	.db #0x03	; 3
   4A3F 03                  147 	.db #0x03	; 3
   4A40                     148 _g_tiles_07:
   4A40 03                  149 	.db #0x03	; 3
   4A41 03                  150 	.db #0x03	; 3
   4A42 09                  151 	.db #0x09	; 9
   4A43 03                  152 	.db #0x03	; 3
   4A44 09                  153 	.db #0x09	; 9
   4A45 03                  154 	.db #0x03	; 3
   4A46 03                  155 	.db #0x03	; 3
   4A47 03                  156 	.db #0x03	; 3
   4A48                     157 _g_tiles_08:
   4A48 56                  158 	.db #0x56	; 86	'V'
   4A49 56                  159 	.db #0x56	; 86	'V'
   4A4A 03                  160 	.db #0x03	; 3
   4A4B 03                  161 	.db #0x03	; 3
   4A4C A9                  162 	.db #0xA9	; 169
   4A4D 56                  163 	.db #0x56	; 86	'V'
   4A4E FC                  164 	.db #0xFC	; 252
   4A4F 03                  165 	.db #0x03	; 3
   4A50                     166 _g_tiles_09:
   4A50 A9                  167 	.db #0xA9	; 169
   4A51 A9                  168 	.db #0xA9	; 169
   4A52 03                  169 	.db #0x03	; 3
   4A53 03                  170 	.db #0x03	; 3
   4A54 A9                  171 	.db #0xA9	; 169
   4A55 56                  172 	.db #0x56	; 86	'V'
   4A56 03                  173 	.db #0x03	; 3
   4A57 FC                  174 	.db #0xFC	; 252
   4A58                     175 _g_tiles_10:
   4A58 FF                  176 	.db #0xFF	; 255
   4A59 FF                  177 	.db #0xFF	; 255
   4A5A FF                  178 	.db #0xFF	; 255
   4A5B FF                  179 	.db #0xFF	; 255
   4A5C FF                  180 	.db #0xFF	; 255
   4A5D FF                  181 	.db #0xFF	; 255
   4A5E FF                  182 	.db #0xFF	; 255
   4A5F FF                  183 	.db #0xFF	; 255
   4A60                     184 _g_tiles_11:
   4A60 CC                  185 	.db #0xCC	; 204
   4A61 3C                  186 	.db #0x3C	; 60
   4A62 6C                  187 	.db #0x6C	; 108	'l'
   4A63 8D                  188 	.db #0x8D	; 141
   4A64 2D                  189 	.db #0x2D	; 45
   4A65 CC                  190 	.db #0xCC	; 204
   4A66 2D                  191 	.db #0x2D	; 45
   4A67 6C                  192 	.db #0x6C	; 108	'l'
   4A68                     193 _g_tiles_12:
   4A68 6C                  194 	.db #0x6C	; 108	'l'
   4A69 9C                  195 	.db #0x9C	; 156
   4A6A 1E                  196 	.db #0x1E	; 30
   4A6B CC                  197 	.db #0xCC	; 204
   4A6C 0F                  198 	.db #0x0F	; 15
   4A6D 6C                  199 	.db #0x6C	; 108	'l'
   4A6E 8D                  200 	.db #0x8D	; 141
   4A6F 1E                  201 	.db #0x1E	; 30
   4A70                     202 _g_tiles_13:
   4A70 CC                  203 	.db #0xCC	; 204
   4A71 3C                  204 	.db #0x3C	; 60
   4A72 CC                  205 	.db #0xCC	; 204
   4A73 CC                  206 	.db #0xCC	; 204
   4A74 6C                  207 	.db #0x6C	; 108	'l'
   4A75 3C                  208 	.db #0x3C	; 60
   4A76 6C                  209 	.db #0x6C	; 108	'l'
   4A77 3C                  210 	.db #0x3C	; 60
   4A78                     211 _g_tiles_14:
   4A78 3C                  212 	.db #0x3C	; 60
   4A79 CC                  213 	.db #0xCC	; 204
   4A7A CC                  214 	.db #0xCC	; 204
   4A7B CC                  215 	.db #0xCC	; 204
   4A7C 3C                  216 	.db #0x3C	; 60
   4A7D 9C                  217 	.db #0x9C	; 156
   4A7E 3C                  218 	.db #0x3C	; 60
   4A7F 9C                  219 	.db #0x9C	; 156
   4A80                     220 _g_tiles_15:
   4A80 0C                  221 	.db #0x0C	; 12
   4A81 0C                  222 	.db #0x0C	; 12
   4A82 0C                  223 	.db #0x0C	; 12
   4A83 0C                  224 	.db #0x0C	; 12
   4A84 0C                  225 	.db #0x0C	; 12
   4A85 0C                  226 	.db #0x0C	; 12
   4A86 0C                  227 	.db #0x0C	; 12
   4A87 0C                  228 	.db #0x0C	; 12
   4A88                     229 _g_tiles_16:
   4A88 2D                  230 	.db #0x2D	; 45
   4A89 3C                  231 	.db #0x3C	; 60
   4A8A 8D                  232 	.db #0x8D	; 141
   4A8B 1E                  233 	.db #0x1E	; 30
   4A8C CC                  234 	.db #0xCC	; 204
   4A8D 0F                  235 	.db #0x0F	; 15
   4A8E 6C                  236 	.db #0x6C	; 108	'l'
   4A8F 3C                  237 	.db #0x3C	; 60
   4A90                     238 _g_tiles_17:
   4A90 CC                  239 	.db #0xCC	; 204
   4A91 1E                  240 	.db #0x1E	; 30
   4A92 6C                  241 	.db #0x6C	; 108	'l'
   4A93 9C                  242 	.db #0x9C	; 156
   4A94 0F                  243 	.db #0x0F	; 15
   4A95 CC                  244 	.db #0xCC	; 204
   4A96 3C                  245 	.db #0x3C	; 60
   4A97 6C                  246 	.db #0x6C	; 108	'l'
   4A98                     247 _g_tiles_18:
   4A98 6C                  248 	.db #0x6C	; 108	'l'
   4A99 3C                  249 	.db #0x3C	; 60
   4A9A 6C                  250 	.db #0x6C	; 108	'l'
   4A9B 3C                  251 	.db #0x3C	; 60
   4A9C CC                  252 	.db #0xCC	; 204
   4A9D CC                  253 	.db #0xCC	; 204
   4A9E CC                  254 	.db #0xCC	; 204
   4A9F 3C                  255 	.db #0x3C	; 60
   4AA0                     256 _g_tiles_19:
   4AA0 3C                  257 	.db #0x3C	; 60
   4AA1 9C                  258 	.db #0x9C	; 156
   4AA2 3C                  259 	.db #0x3C	; 60
   4AA3 9C                  260 	.db #0x9C	; 156
   4AA4 CC                  261 	.db #0xCC	; 204
   4AA5 CC                  262 	.db #0xCC	; 204
   4AA6 3C                  263 	.db #0x3C	; 60
   4AA7 CC                  264 	.db #0xCC	; 204
                            265 	.area _INITIALIZER
                            266 	.area _CABS (ABS)
