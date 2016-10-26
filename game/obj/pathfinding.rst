                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module pathfinding
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _abs
                             12 	.globl _getTilePtr
                             13 	.globl _camino
                             14 	.globl _sol_tam
                             15 	.globl _bitWeights
                             16 	.globl _anyadirALista
                             17 	.globl _adjacentTiles
                             18 	.globl _pathFinding
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   62FB                      26 _sol_tam::
   62FB                      27 	.ds 1
   62FC                      28 _camino::
   62FC                      29 	.ds 200
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/pathfinding.c:10: u8 anyadirALista(u8 x, u8 y){
                             55 ;	---------------------------------
                             56 ; Function anyadirALista
                             57 ; ---------------------------------
   3F0A                      58 _anyadirALista::
                             59 ;src/pathfinding.c:11: u8 anyadido = 0;
   3F0A 0E 00         [ 7]   60 	ld	c,#0x00
                             61 ;src/pathfinding.c:13: if(sol_tam < CAMINO_TAM){
   3F0C 3A FB 62      [13]   62 	ld	a,(#_sol_tam + 0)
   3F0F D6 C8         [ 7]   63 	sub	a, #0xC8
   3F11 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   3F13 01 FC 62      [10]   66 	ld	bc,#_camino+0
   3F16 2A FB 62      [16]   67 	ld	hl,(_sol_tam)
   3F19 26 00         [ 7]   68 	ld	h,#0x00
   3F1B 09            [11]   69 	add	hl,bc
   3F1C FD 21 02 00   [14]   70 	ld	iy,#2
   3F20 FD 39         [15]   71 	add	iy,sp
   3F22 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3F25 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   3F26 21 FB 62      [10]   75 	ld	hl, #_sol_tam+0
   3F29 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   3F2A 2A FB 62      [16]   78 	ld	hl,(_sol_tam)
   3F2D 26 00         [ 7]   79 	ld	h,#0x00
   3F2F 09            [11]   80 	add	hl,bc
   3F30 FD 21 03 00   [14]   81 	ld	iy,#3
   3F34 FD 39         [15]   82 	add	iy,sp
   3F36 FD 7E 00      [19]   83 	ld	a,0 (iy)
   3F39 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   3F3A 21 FB 62      [10]   86 	ld	hl, #_sol_tam+0
   3F3D 34            [11]   87 	inc	(hl)
                             88 ;src/pathfinding.c:18: anyadido = 1;
   3F3E 0E 01         [ 7]   89 	ld	c,#0x01
   3F40                      90 00102$:
                             91 ;src/pathfinding.c:21: return anyadido;
   3F40 69            [ 4]   92 	ld	l,c
   3F41 C9            [10]   93 	ret
   3F42                      94 _bitWeights:
   3F42 01 00                95 	.dw #0x0001
   3F44 02 00                96 	.dw #0x0002
   3F46 04 00                97 	.dw #0x0004
   3F48 08 00                98 	.dw #0x0008
   3F4A 10 00                99 	.dw #0x0010
   3F4C 20 00               100 	.dw #0x0020
   3F4E 40 00               101 	.dw #0x0040
   3F50 80 00               102 	.dw #0x0080
                            103 ;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                            104 ;	---------------------------------
                            105 ; Function adjacentTiles
                            106 ; ---------------------------------
   3F52                     107 _adjacentTiles::
   3F52 DD E5         [15]  108 	push	ix
   3F54 DD 21 00 00   [14]  109 	ld	ix,#0
   3F58 DD 39         [15]  110 	add	ix,sp
   3F5A 21 DF FF      [10]  111 	ld	hl,#-33
   3F5D 39            [11]  112 	add	hl,sp
   3F5E F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   3F5F DD 36 EF 04   [19]  115 	ld	-17 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   3F63 DD 36 ED 00   [19]  117 	ld	-19 (ix),#0x00
   3F67 DD 36 EE 00   [19]  118 	ld	-18 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   3F6B DD 36 EB 00   [19]  120 	ld	-21 (ix),#0x00
   3F6F DD 36 EC 00   [19]  121 	ld	-20 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   3F73 DD 36 E9 00   [19]  123 	ld	-23 (ix),#0x00
   3F77 DD 36 EA 00   [19]  124 	ld	-22 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   3F7B DD 36 E1 00   [19]  126 	ld	-31 (ix),#0x00
   3F7F DD 36 E2 00   [19]  127 	ld	-30 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   3F83 DD 36 E3 00   [19]  129 	ld	-29 (ix),#0x00
   3F87 DD 36 E4 00   [19]  130 	ld	-28 (ix),#0x00
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   3F8B DD 36 E5 00   [19]  132 	ld	-27 (ix),#0x00
   3F8F DD 36 E6 00   [19]  133 	ld	-26 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   3F93 21 00 00      [10]  135 	ld	hl,#0x0000
   3F96 E3            [19]  136 	ex	(sp), hl
                            137 ;src/pathfinding.c:43: if(y < f_y)
   3F97 DD 7E 05      [19]  138 	ld	a,5 (ix)
   3F9A DD 96 07      [19]  139 	sub	a, 7 (ix)
   3F9D 3E 00         [ 7]  140 	ld	a,#0x00
   3F9F 17            [ 4]  141 	rla
   3FA0 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   3FA1 DD 7E 04      [19]  144 	ld	a,4 (ix)
   3FA4 DD 96 06      [19]  145 	sub	a, 6 (ix)
   3FA7 20 1C         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   3FA9 79            [ 4]  148 	ld	a,c
   3FAA B7            [ 4]  149 	or	a, a
   3FAB 28 04         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   3FAD 21 FF FF      [10]  152 	ld	hl,#0xFFFF
   3FB0 E3            [19]  153 	ex	(sp), hl
   3FB1                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   3FB1 DD 7E 07      [19]  156 	ld	a,7 (ix)
   3FB4 DD 96 05      [19]  157 	sub	a, 5 (ix)
   3FB7 D2 39 40      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   3FBA DD 36 E5 FF   [19]  160 	ld	-27 (ix),#0xFF
   3FBE DD 36 E6 FF   [19]  161 	ld	-26 (ix),#0xFF
   3FC2 C3 39 40      [10]  162 	jp	00125$
   3FC5                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   3FC5 DD 7E 04      [19]  165 	ld	a,4 (ix)
   3FC8 DD 96 06      [19]  166 	sub	a, 6 (ix)
   3FCB 3E 00         [ 7]  167 	ld	a,#0x00
   3FCD 17            [ 4]  168 	rla
   3FCE 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   3FCF DD 7E 06      [19]  171 	ld	a,6 (ix)
   3FD2 DD 96 04      [19]  172 	sub	a, 4 (ix)
   3FD5 3E 00         [ 7]  173 	ld	a,#0x00
   3FD7 17            [ 4]  174 	rla
   3FD8 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   3FD9 DD 7E 05      [19]  177 	ld	a,5 (ix)
   3FDC DD 96 07      [19]  178 	sub	a, 7 (ix)
   3FDF 20 1A         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   3FE1 78            [ 4]  181 	ld	a,b
   3FE2 B7            [ 4]  182 	or	a, a
   3FE3 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   3FE5 DD 36 E1 FF   [19]  185 	ld	-31 (ix),#0xFF
   3FE9 DD 36 E2 FF   [19]  186 	ld	-30 (ix),#0xFF
   3FED                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   3FED 7B            [ 4]  189 	ld	a,e
   3FEE B7            [ 4]  190 	or	a, a
   3FEF 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   3FF1 DD 36 E3 FF   [19]  193 	ld	-29 (ix),#0xFF
   3FF5 DD 36 E4 FF   [19]  194 	ld	-28 (ix),#0xFF
   3FF9 18 3E         [12]  195 	jr	00125$
   3FFB                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   3FFB 78            [ 4]  198 	ld	a,b
   3FFC B7            [ 4]  199 	or	a, a
   3FFD 28 1C         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   3FFF 79            [ 4]  202 	ld	a,c
   4000 B7            [ 4]  203 	or	a, a
   4001 28 06         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   4003 21 FF FF      [10]  206 	ld	hl,#0xFFFF
   4006 E3            [19]  207 	ex	(sp), hl
   4007 18 08         [12]  208 	jr	00111$
   4009                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   4009 DD 36 E5 FF   [19]  211 	ld	-27 (ix),#0xFF
   400D DD 36 E6 FF   [19]  212 	ld	-26 (ix),#0xFF
   4011                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4011 DD 36 E1 FF   [19]  215 	ld	-31 (ix),#0xFF
   4015 DD 36 E2 FF   [19]  216 	ld	-30 (ix),#0xFF
   4019 18 1E         [12]  217 	jr	00125$
   401B                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   401B 7B            [ 4]  220 	ld	a,e
   401C B7            [ 4]  221 	or	a, a
   401D 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   401F 79            [ 4]  224 	ld	a,c
   4020 B7            [ 4]  225 	or	a, a
   4021 28 06         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   4023 21 FF FF      [10]  228 	ld	hl,#0xFFFF
   4026 E3            [19]  229 	ex	(sp), hl
   4027 18 08         [12]  230 	jr	00114$
   4029                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4029 DD 36 E5 FF   [19]  233 	ld	-27 (ix),#0xFF
   402D DD 36 E6 FF   [19]  234 	ld	-26 (ix),#0xFF
   4031                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4031 DD 36 E3 FF   [19]  237 	ld	-29 (ix),#0xFF
   4035 DD 36 E4 FF   [19]  238 	ld	-28 (ix),#0xFF
   4039                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   4039 DD 7E 05      [19]  241 	ld	a,5 (ix)
   403C C6 FE         [ 7]  242 	add	a,#0xFE
   403E DD 77 F2      [19]  243 	ld	-14 (ix), a
   4041 F5            [11]  244 	push	af
   4042 33            [ 6]  245 	inc	sp
   4043 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4046 F5            [11]  247 	push	af
   4047 33            [ 6]  248 	inc	sp
   4048 DD 6E 08      [19]  249 	ld	l,8 (ix)
   404B DD 66 09      [19]  250 	ld	h,9 (ix)
   404E E5            [11]  251 	push	hl
   404F CD 61 4B      [17]  252 	call	_getTilePtr
   4052 F1            [10]  253 	pop	af
   4053 F1            [10]  254 	pop	af
   4054 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   4055 DD 7E 04      [19]  257 	ld	a,4 (ix)
   4058 C6 04         [ 7]  258 	add	a, #0x04
   405A DD 77 F3      [19]  259 	ld	-13 (ix),a
                            260 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   405D DD 7E 06      [19]  261 	ld	a,6 (ix)
   4060 DD 77 FC      [19]  262 	ld	-4 (ix),a
   4063 DD 36 FD 00   [19]  263 	ld	-3 (ix),#0x00
   4067 DD 7E 04      [19]  264 	ld	a,4 (ix)
   406A DD 77 F6      [19]  265 	ld	-10 (ix),a
   406D DD 36 F7 00   [19]  266 	ld	-9 (ix),#0x00
   4071 DD 7E 07      [19]  267 	ld	a,7 (ix)
   4074 DD 77 FA      [19]  268 	ld	-6 (ix),a
   4077 DD 36 FB 00   [19]  269 	ld	-5 (ix),#0x00
   407B DD 7E 05      [19]  270 	ld	a,5 (ix)
   407E DD 77 F4      [19]  271 	ld	-12 (ix),a
   4081 DD 36 F5 00   [19]  272 	ld	-11 (ix),#0x00
   4085 DD 7E FC      [19]  273 	ld	a,-4 (ix)
   4088 DD 96 F6      [19]  274 	sub	a, -10 (ix)
   408B DD 77 FE      [19]  275 	ld	-2 (ix),a
   408E DD 7E FD      [19]  276 	ld	a,-3 (ix)
   4091 DD 9E F7      [19]  277 	sbc	a, -9 (ix)
   4094 DD 77 FF      [19]  278 	ld	-1 (ix),a
                            279 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   4097 3E 02         [ 7]  280 	ld	a,#0x02
   4099 91            [ 4]  281 	sub	a, c
   409A DA 2E 41      [10]  282 	jp	C,00127$
                            283 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   409D DD 66 F2      [19]  284 	ld	h,-14 (ix)
   40A0 DD 6E F3      [19]  285 	ld	l,-13 (ix)
   40A3 E5            [11]  286 	push	hl
   40A4 DD 6E 08      [19]  287 	ld	l,8 (ix)
   40A7 DD 66 09      [19]  288 	ld	h,9 (ix)
   40AA E5            [11]  289 	push	hl
   40AB CD 61 4B      [17]  290 	call	_getTilePtr
   40AE F1            [10]  291 	pop	af
   40AF F1            [10]  292 	pop	af
   40B0 4E            [ 7]  293 	ld	c,(hl)
   40B1 3E 02         [ 7]  294 	ld	a,#0x02
   40B3 91            [ 4]  295 	sub	a, c
   40B4 38 78         [12]  296 	jr	C,00127$
                            297 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   40B6 DD 6E FE      [19]  298 	ld	l,-2 (ix)
   40B9 DD 66 FF      [19]  299 	ld	h,-1 (ix)
   40BC E5            [11]  300 	push	hl
   40BD CD A5 4B      [17]  301 	call	_abs
   40C0 F1            [10]  302 	pop	af
   40C1 DD 74 F9      [19]  303 	ld	-7 (ix),h
   40C4 DD 75 F8      [19]  304 	ld	-8 (ix),l
   40C7 DD 7E F4      [19]  305 	ld	a,-12 (ix)
   40CA C6 FE         [ 7]  306 	add	a,#0xFE
   40CC DD 77 F0      [19]  307 	ld	-16 (ix),a
   40CF DD 7E F5      [19]  308 	ld	a,-11 (ix)
   40D2 CE FF         [ 7]  309 	adc	a,#0xFF
   40D4 DD 77 F1      [19]  310 	ld	-15 (ix),a
   40D7 DD 7E FA      [19]  311 	ld	a,-6 (ix)
   40DA DD 96 F0      [19]  312 	sub	a, -16 (ix)
   40DD DD 77 F0      [19]  313 	ld	-16 (ix),a
   40E0 DD 7E FB      [19]  314 	ld	a,-5 (ix)
   40E3 DD 9E F1      [19]  315 	sbc	a, -15 (ix)
   40E6 DD 77 F1      [19]  316 	ld	-15 (ix),a
   40E9 DD 6E F0      [19]  317 	ld	l,-16 (ix)
   40EC DD 66 F1      [19]  318 	ld	h,-15 (ix)
   40EF E5            [11]  319 	push	hl
   40F0 CD A5 4B      [17]  320 	call	_abs
   40F3 F1            [10]  321 	pop	af
   40F4 DD 74 F1      [19]  322 	ld	-15 (ix),h
   40F7 DD 75 F0      [19]  323 	ld	-16 (ix),l
   40FA DD 7E F8      [19]  324 	ld	a,-8 (ix)
   40FD DD 86 F0      [19]  325 	add	a, -16 (ix)
   4100 DD 77 F0      [19]  326 	ld	-16 (ix),a
   4103 DD 7E F9      [19]  327 	ld	a,-7 (ix)
   4106 DD 8E F1      [19]  328 	adc	a, -15 (ix)
   4109 DD 77 F1      [19]  329 	ld	-15 (ix),a
   410C DD 7E F0      [19]  330 	ld	a,-16 (ix)
   410F DD 86 E5      [19]  331 	add	a, -27 (ix)
   4112 DD 77 F0      [19]  332 	ld	-16 (ix),a
   4115 DD 7E F1      [19]  333 	ld	a,-15 (ix)
   4118 DD 8E E6      [19]  334 	adc	a, -26 (ix)
   411B DD 77 F1      [19]  335 	ld	-15 (ix),a
   411E DD 7E F0      [19]  336 	ld	a,-16 (ix)
   4121 DD 77 ED      [19]  337 	ld	-19 (ix),a
   4124 DD 7E F1      [19]  338 	ld	a,-15 (ix)
   4127 DD 77 EE      [19]  339 	ld	-18 (ix),a
                            340 ;src/pathfinding.c:81: resultado = 0;
   412A DD 36 EF 00   [19]  341 	ld	-17 (ix),#0x00
   412E                     342 00127$:
                            343 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 &&
   412E DD 46 05      [19]  344 	ld	b,5 (ix)
   4131 04            [ 4]  345 	inc	b
   4132 04            [ 4]  346 	inc	b
   4133 C5            [11]  347 	push	bc
   4134 33            [ 6]  348 	inc	sp
   4135 DD 7E 04      [19]  349 	ld	a,4 (ix)
   4138 F5            [11]  350 	push	af
   4139 33            [ 6]  351 	inc	sp
   413A DD 6E 08      [19]  352 	ld	l,8 (ix)
   413D DD 66 09      [19]  353 	ld	h,9 (ix)
   4140 E5            [11]  354 	push	hl
   4141 CD 61 4B      [17]  355 	call	_getTilePtr
   4144 F1            [10]  356 	pop	af
   4145 F1            [10]  357 	pop	af
   4146 4E            [ 7]  358 	ld	c,(hl)
   4147 3E 02         [ 7]  359 	ld	a,#0x02
   4149 91            [ 4]  360 	sub	a, c
   414A DA 13 42      [10]  361 	jp	C,00135$
                            362 ;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   414D DD 7E 05      [19]  363 	ld	a,5 (ix)
   4150 C6 16         [ 7]  364 	add	a, #0x16
   4152 47            [ 4]  365 	ld	b,a
   4153 C5            [11]  366 	push	bc
   4154 33            [ 6]  367 	inc	sp
   4155 DD 7E F3      [19]  368 	ld	a,-13 (ix)
   4158 F5            [11]  369 	push	af
   4159 33            [ 6]  370 	inc	sp
   415A DD 6E 08      [19]  371 	ld	l,8 (ix)
   415D DD 66 09      [19]  372 	ld	h,9 (ix)
   4160 E5            [11]  373 	push	hl
   4161 CD 61 4B      [17]  374 	call	_getTilePtr
   4164 F1            [10]  375 	pop	af
   4165 F1            [10]  376 	pop	af
   4166 DD 74 F1      [19]  377 	ld	-15 (ix),h
   4169 DD 75 F0      [19]  378 	ld	-16 (ix), l
   416C DD 66 F1      [19]  379 	ld	h,-15 (ix)
   416F 7E            [ 7]  380 	ld	a,(hl)
   4170 DD 77 F0      [19]  381 	ld	-16 (ix),a
   4173 3E 02         [ 7]  382 	ld	a,#0x02
   4175 DD 96 F0      [19]  383 	sub	a, -16 (ix)
   4178 DA 13 42      [10]  384 	jp	C,00135$
                            385 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   417B DD 6E FE      [19]  386 	ld	l,-2 (ix)
   417E DD 66 FF      [19]  387 	ld	h,-1 (ix)
   4181 E5            [11]  388 	push	hl
   4182 CD A5 4B      [17]  389 	call	_abs
   4185 F1            [10]  390 	pop	af
   4186 DD 74 F1      [19]  391 	ld	-15 (ix),h
   4189 DD 75 F0      [19]  392 	ld	-16 (ix),l
   418C DD 7E F4      [19]  393 	ld	a,-12 (ix)
   418F C6 02         [ 7]  394 	add	a, #0x02
   4191 DD 77 F8      [19]  395 	ld	-8 (ix),a
   4194 DD 7E F5      [19]  396 	ld	a,-11 (ix)
   4197 CE 00         [ 7]  397 	adc	a, #0x00
   4199 DD 77 F9      [19]  398 	ld	-7 (ix),a
   419C DD 7E FA      [19]  399 	ld	a,-6 (ix)
   419F DD 96 F8      [19]  400 	sub	a, -8 (ix)
   41A2 DD 77 F8      [19]  401 	ld	-8 (ix),a
   41A5 DD 7E FB      [19]  402 	ld	a,-5 (ix)
   41A8 DD 9E F9      [19]  403 	sbc	a, -7 (ix)
   41AB DD 77 F9      [19]  404 	ld	-7 (ix),a
   41AE DD 6E F8      [19]  405 	ld	l,-8 (ix)
   41B1 DD 66 F9      [19]  406 	ld	h,-7 (ix)
   41B4 E5            [11]  407 	push	hl
   41B5 CD A5 4B      [17]  408 	call	_abs
   41B8 F1            [10]  409 	pop	af
   41B9 DD 74 F9      [19]  410 	ld	-7 (ix),h
   41BC DD 75 F8      [19]  411 	ld	-8 (ix),l
   41BF DD 7E F0      [19]  412 	ld	a,-16 (ix)
   41C2 DD 86 F8      [19]  413 	add	a, -8 (ix)
   41C5 DD 77 F0      [19]  414 	ld	-16 (ix),a
   41C8 DD 7E F1      [19]  415 	ld	a,-15 (ix)
   41CB DD 8E F9      [19]  416 	adc	a, -7 (ix)
   41CE DD 77 F1      [19]  417 	ld	-15 (ix),a
   41D1 DD 7E F0      [19]  418 	ld	a,-16 (ix)
   41D4 DD 86 DF      [19]  419 	add	a, -33 (ix)
   41D7 DD 77 F0      [19]  420 	ld	-16 (ix),a
   41DA DD 7E F1      [19]  421 	ld	a,-15 (ix)
   41DD DD 8E E0      [19]  422 	adc	a, -32 (ix)
   41E0 DD 77 F1      [19]  423 	ld	-15 (ix),a
   41E3 DD 7E F0      [19]  424 	ld	a,-16 (ix)
   41E6 DD 77 EB      [19]  425 	ld	-21 (ix),a
   41E9 DD 7E F1      [19]  426 	ld	a,-15 (ix)
   41EC DD 77 EC      [19]  427 	ld	-20 (ix),a
                            428 ;src/pathfinding.c:87: if(resultado == 0){
   41EF DD 7E EF      [19]  429 	ld	a,-17 (ix)
   41F2 B7            [ 4]  430 	or	a, a
   41F3 20 1A         [12]  431 	jr	NZ,00132$
                            432 ;src/pathfinding.c:88: if(dist1 > dist2)
   41F5 DD 7E EB      [19]  433 	ld	a,-21 (ix)
   41F8 DD 96 ED      [19]  434 	sub	a, -19 (ix)
   41FB DD 7E EC      [19]  435 	ld	a,-20 (ix)
   41FE DD 9E EE      [19]  436 	sbc	a, -18 (ix)
   4201 E2 06 42      [10]  437 	jp	PO, 00304$
   4204 EE 80         [ 7]  438 	xor	a, #0x80
   4206                     439 00304$:
   4206 F2 13 42      [10]  440 	jp	P,00135$
                            441 ;src/pathfinding.c:89: resultado = 1;
   4209 DD 36 EF 01   [19]  442 	ld	-17 (ix),#0x01
   420D 18 04         [12]  443 	jr	00135$
   420F                     444 00132$:
                            445 ;src/pathfinding.c:91: resultado = 1;
   420F DD 36 EF 01   [19]  446 	ld	-17 (ix),#0x01
   4213                     447 00135$:
                            448 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4213 DD 4E 04      [19]  449 	ld	c,4 (ix)
   4216 0D            [ 4]  450 	dec	c
   4217 C5            [11]  451 	push	bc
   4218 DD 7E 05      [19]  452 	ld	a,5 (ix)
   421B F5            [11]  453 	push	af
   421C 33            [ 6]  454 	inc	sp
   421D 79            [ 4]  455 	ld	a,c
   421E F5            [11]  456 	push	af
   421F 33            [ 6]  457 	inc	sp
   4220 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4223 DD 66 09      [19]  459 	ld	h,9 (ix)
   4226 E5            [11]  460 	push	hl
   4227 CD 61 4B      [17]  461 	call	_getTilePtr
   422A F1            [10]  462 	pop	af
   422B F1            [10]  463 	pop	af
   422C C1            [10]  464 	pop	bc
   422D 46            [ 7]  465 	ld	b,(hl)
                            466 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   422E DD 7E 05      [19]  467 	ld	a,5 (ix)
   4231 C6 14         [ 7]  468 	add	a, #0x14
   4233 DD 77 F0      [19]  469 	ld	-16 (ix),a
                            470 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4236 DD 7E 05      [19]  471 	ld	a,5 (ix)
   4239 C6 0B         [ 7]  472 	add	a, #0x0B
   423B DD 77 F8      [19]  473 	ld	-8 (ix),a
                            474 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   423E DD 7E FA      [19]  475 	ld	a,-6 (ix)
   4241 DD 96 F4      [19]  476 	sub	a, -12 (ix)
   4244 DD 77 FE      [19]  477 	ld	-2 (ix),a
   4247 DD 7E FB      [19]  478 	ld	a,-5 (ix)
   424A DD 9E F5      [19]  479 	sbc	a, -11 (ix)
   424D DD 77 FF      [19]  480 	ld	-1 (ix),a
                            481 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4250 3E 02         [ 7]  482 	ld	a,#0x02
   4252 90            [ 4]  483 	sub	a, b
   4253 DA 01 43      [10]  484 	jp	C,00148$
                            485 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4256 C5            [11]  486 	push	bc
   4257 DD 7E F0      [19]  487 	ld	a,-16 (ix)
   425A F5            [11]  488 	push	af
   425B 33            [ 6]  489 	inc	sp
   425C 79            [ 4]  490 	ld	a,c
   425D F5            [11]  491 	push	af
   425E 33            [ 6]  492 	inc	sp
   425F DD 6E 08      [19]  493 	ld	l,8 (ix)
   4262 DD 66 09      [19]  494 	ld	h,9 (ix)
   4265 E5            [11]  495 	push	hl
   4266 CD 61 4B      [17]  496 	call	_getTilePtr
   4269 F1            [10]  497 	pop	af
   426A F1            [10]  498 	pop	af
   426B C1            [10]  499 	pop	bc
   426C 46            [ 7]  500 	ld	b,(hl)
   426D 3E 02         [ 7]  501 	ld	a,#0x02
   426F 90            [ 4]  502 	sub	a, b
   4270 DA 01 43      [10]  503 	jp	C,00148$
                            504 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4273 DD 7E F8      [19]  505 	ld	a,-8 (ix)
   4276 F5            [11]  506 	push	af
   4277 33            [ 6]  507 	inc	sp
   4278 79            [ 4]  508 	ld	a,c
   4279 F5            [11]  509 	push	af
   427A 33            [ 6]  510 	inc	sp
   427B DD 6E 08      [19]  511 	ld	l,8 (ix)
   427E DD 66 09      [19]  512 	ld	h,9 (ix)
   4281 E5            [11]  513 	push	hl
   4282 CD 61 4B      [17]  514 	call	_getTilePtr
   4285 F1            [10]  515 	pop	af
   4286 F1            [10]  516 	pop	af
   4287 4E            [ 7]  517 	ld	c,(hl)
   4288 3E 02         [ 7]  518 	ld	a,#0x02
   428A 91            [ 4]  519 	sub	a, c
   428B 38 74         [12]  520 	jr	C,00148$
                            521 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   428D DD 4E F6      [19]  522 	ld	c,-10 (ix)
   4290 DD 46 F7      [19]  523 	ld	b,-9 (ix)
   4293 0B            [ 6]  524 	dec	bc
   4294 DD 7E FC      [19]  525 	ld	a,-4 (ix)
   4297 91            [ 4]  526 	sub	a, c
   4298 4F            [ 4]  527 	ld	c,a
   4299 DD 7E FD      [19]  528 	ld	a,-3 (ix)
   429C 98            [ 4]  529 	sbc	a, b
   429D 47            [ 4]  530 	ld	b,a
   429E C5            [11]  531 	push	bc
   429F CD A5 4B      [17]  532 	call	_abs
   42A2 E3            [19]  533 	ex	(sp),hl
   42A3 DD 6E FE      [19]  534 	ld	l,-2 (ix)
   42A6 DD 66 FF      [19]  535 	ld	h,-1 (ix)
   42A9 E5            [11]  536 	push	hl
   42AA CD A5 4B      [17]  537 	call	_abs
   42AD F1            [10]  538 	pop	af
   42AE C1            [10]  539 	pop	bc
   42AF 09            [11]  540 	add	hl,bc
   42B0 DD 5E E3      [19]  541 	ld	e,-29 (ix)
   42B3 DD 56 E4      [19]  542 	ld	d,-28 (ix)
   42B6 19            [11]  543 	add	hl,de
   42B7 DD 75 E9      [19]  544 	ld	-23 (ix),l
   42BA DD 74 EA      [19]  545 	ld	-22 (ix),h
                            546 ;src/pathfinding.c:99: if(resultado == 0){
   42BD DD 7E EF      [19]  547 	ld	a,-17 (ix)
   42C0 B7            [ 4]  548 	or	a, a
   42C1 20 1A         [12]  549 	jr	NZ,00145$
                            550 ;src/pathfinding.c:100: if(dist1 >= dist3)
   42C3 DD 7E ED      [19]  551 	ld	a,-19 (ix)
   42C6 DD 96 E9      [19]  552 	sub	a, -23 (ix)
   42C9 DD 7E EE      [19]  553 	ld	a,-18 (ix)
   42CC DD 9E EA      [19]  554 	sbc	a, -22 (ix)
   42CF E2 D4 42      [10]  555 	jp	PO, 00305$
   42D2 EE 80         [ 7]  556 	xor	a, #0x80
   42D4                     557 00305$:
   42D4 FA 01 43      [10]  558 	jp	M,00148$
                            559 ;src/pathfinding.c:101: resultado = 2;
   42D7 DD 36 EF 02   [19]  560 	ld	-17 (ix),#0x02
   42DB 18 24         [12]  561 	jr	00148$
   42DD                     562 00145$:
                            563 ;src/pathfinding.c:102: }else if(resultado == 1){
   42DD DD 7E EF      [19]  564 	ld	a,-17 (ix)
   42E0 3D            [ 4]  565 	dec	a
   42E1 20 1A         [12]  566 	jr	NZ,00142$
                            567 ;src/pathfinding.c:103: if(dist2 >= dist3)
   42E3 DD 7E EB      [19]  568 	ld	a,-21 (ix)
   42E6 DD 96 E9      [19]  569 	sub	a, -23 (ix)
   42E9 DD 7E EC      [19]  570 	ld	a,-20 (ix)
   42EC DD 9E EA      [19]  571 	sbc	a, -22 (ix)
   42EF E2 F4 42      [10]  572 	jp	PO, 00308$
   42F2 EE 80         [ 7]  573 	xor	a, #0x80
   42F4                     574 00308$:
   42F4 FA 01 43      [10]  575 	jp	M,00148$
                            576 ;src/pathfinding.c:104: resultado = 2;
   42F7 DD 36 EF 02   [19]  577 	ld	-17 (ix),#0x02
   42FB 18 04         [12]  578 	jr	00148$
   42FD                     579 00142$:
                            580 ;src/pathfinding.c:106: resultado = 2;
   42FD DD 36 EF 02   [19]  581 	ld	-17 (ix),#0x02
   4301                     582 00148$:
                            583 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 &&
   4301 DD 46 04      [19]  584 	ld	b,4 (ix)
   4304 04            [ 4]  585 	inc	b
   4305 DD 7E 05      [19]  586 	ld	a,5 (ix)
   4308 F5            [11]  587 	push	af
   4309 33            [ 6]  588 	inc	sp
   430A C5            [11]  589 	push	bc
   430B 33            [ 6]  590 	inc	sp
   430C DD 6E 08      [19]  591 	ld	l,8 (ix)
   430F DD 66 09      [19]  592 	ld	h,9 (ix)
   4312 E5            [11]  593 	push	hl
   4313 CD 61 4B      [17]  594 	call	_getTilePtr
   4316 F1            [10]  595 	pop	af
   4317 F1            [10]  596 	pop	af
   4318 4E            [ 7]  597 	ld	c,(hl)
   4319 3E 02         [ 7]  598 	ld	a,#0x02
   431B 91            [ 4]  599 	sub	a, c
   431C DA 28 44      [10]  600 	jp	C,00167$
                            601 ;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
   431F DD 7E 04      [19]  602 	ld	a,4 (ix)
   4322 C6 05         [ 7]  603 	add	a, #0x05
   4324 47            [ 4]  604 	ld	b,a
   4325 C5            [11]  605 	push	bc
   4326 DD 7E F0      [19]  606 	ld	a,-16 (ix)
   4329 F5            [11]  607 	push	af
   432A 33            [ 6]  608 	inc	sp
   432B C5            [11]  609 	push	bc
   432C 33            [ 6]  610 	inc	sp
   432D DD 6E 08      [19]  611 	ld	l,8 (ix)
   4330 DD 66 09      [19]  612 	ld	h,9 (ix)
   4333 E5            [11]  613 	push	hl
   4334 CD 61 4B      [17]  614 	call	_getTilePtr
   4337 F1            [10]  615 	pop	af
   4338 F1            [10]  616 	pop	af
   4339 C1            [10]  617 	pop	bc
   433A 4E            [ 7]  618 	ld	c,(hl)
   433B 3E 02         [ 7]  619 	ld	a,#0x02
   433D 91            [ 4]  620 	sub	a, c
   433E DA 28 44      [10]  621 	jp	C,00167$
                            622 ;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4341 DD 7E F8      [19]  623 	ld	a,-8 (ix)
   4344 F5            [11]  624 	push	af
   4345 33            [ 6]  625 	inc	sp
   4346 C5            [11]  626 	push	bc
   4347 33            [ 6]  627 	inc	sp
   4348 DD 6E 08      [19]  628 	ld	l,8 (ix)
   434B DD 66 09      [19]  629 	ld	h,9 (ix)
   434E E5            [11]  630 	push	hl
   434F CD 61 4B      [17]  631 	call	_getTilePtr
   4352 F1            [10]  632 	pop	af
   4353 F1            [10]  633 	pop	af
   4354 4E            [ 7]  634 	ld	c,(hl)
   4355 3E 02         [ 7]  635 	ld	a,#0x02
   4357 91            [ 4]  636 	sub	a, c
   4358 DA 28 44      [10]  637 	jp	C,00167$
                            638 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   435B DD 7E F6      [19]  639 	ld	a,-10 (ix)
   435E C6 01         [ 7]  640 	add	a, #0x01
   4360 DD 77 F0      [19]  641 	ld	-16 (ix),a
   4363 DD 7E F7      [19]  642 	ld	a,-9 (ix)
   4366 CE 00         [ 7]  643 	adc	a, #0x00
   4368 DD 77 F1      [19]  644 	ld	-15 (ix),a
   436B DD 7E FC      [19]  645 	ld	a,-4 (ix)
   436E DD 96 F0      [19]  646 	sub	a, -16 (ix)
   4371 DD 77 F0      [19]  647 	ld	-16 (ix),a
   4374 DD 7E FD      [19]  648 	ld	a,-3 (ix)
   4377 DD 9E F1      [19]  649 	sbc	a, -15 (ix)
   437A DD 77 F1      [19]  650 	ld	-15 (ix),a
   437D DD 6E F0      [19]  651 	ld	l,-16 (ix)
   4380 DD 66 F1      [19]  652 	ld	h,-15 (ix)
   4383 E5            [11]  653 	push	hl
   4384 CD A5 4B      [17]  654 	call	_abs
   4387 F1            [10]  655 	pop	af
   4388 DD 74 F1      [19]  656 	ld	-15 (ix),h
   438B DD 75 F0      [19]  657 	ld	-16 (ix),l
   438E DD 6E FE      [19]  658 	ld	l,-2 (ix)
   4391 DD 66 FF      [19]  659 	ld	h,-1 (ix)
   4394 E5            [11]  660 	push	hl
   4395 CD A5 4B      [17]  661 	call	_abs
   4398 F1            [10]  662 	pop	af
   4399 DD 74 F9      [19]  663 	ld	-7 (ix),h
   439C DD 75 F8      [19]  664 	ld	-8 (ix),l
   439F DD 7E F0      [19]  665 	ld	a,-16 (ix)
   43A2 DD 86 F8      [19]  666 	add	a, -8 (ix)
   43A5 DD 77 F0      [19]  667 	ld	-16 (ix),a
   43A8 DD 7E F1      [19]  668 	ld	a,-15 (ix)
   43AB DD 8E F9      [19]  669 	adc	a, -7 (ix)
   43AE DD 77 F1      [19]  670 	ld	-15 (ix),a
   43B1 DD 7E F0      [19]  671 	ld	a,-16 (ix)
   43B4 DD 86 E1      [19]  672 	add	a, -31 (ix)
   43B7 DD 77 E7      [19]  673 	ld	-25 (ix),a
   43BA DD 7E F1      [19]  674 	ld	a,-15 (ix)
   43BD DD 8E E2      [19]  675 	adc	a, -30 (ix)
   43C0 DD 77 E8      [19]  676 	ld	-24 (ix),a
                            677 ;src/pathfinding.c:114: if(resultado == 0){
   43C3 DD 7E EF      [19]  678 	ld	a,-17 (ix)
   43C6 B7            [ 4]  679 	or	a, a
   43C7 20 1A         [12]  680 	jr	NZ,00164$
                            681 ;src/pathfinding.c:115: if(dist1 >= dist4)
   43C9 DD 7E ED      [19]  682 	ld	a,-19 (ix)
   43CC DD 96 E7      [19]  683 	sub	a, -25 (ix)
   43CF DD 7E EE      [19]  684 	ld	a,-18 (ix)
   43D2 DD 9E E8      [19]  685 	sbc	a, -24 (ix)
   43D5 E2 DA 43      [10]  686 	jp	PO, 00309$
   43D8 EE 80         [ 7]  687 	xor	a, #0x80
   43DA                     688 00309$:
   43DA FA 28 44      [10]  689 	jp	M,00167$
                            690 ;src/pathfinding.c:116: resultado = 3;
   43DD DD 36 EF 03   [19]  691 	ld	-17 (ix),#0x03
   43E1 18 45         [12]  692 	jr	00167$
   43E3                     693 00164$:
                            694 ;src/pathfinding.c:117: }else if(resultado == 1){
   43E3 DD 7E EF      [19]  695 	ld	a,-17 (ix)
   43E6 3D            [ 4]  696 	dec	a
   43E7 20 1A         [12]  697 	jr	NZ,00161$
                            698 ;src/pathfinding.c:118: if(dist2 >= dist4)
   43E9 DD 7E EB      [19]  699 	ld	a,-21 (ix)
   43EC DD 96 E7      [19]  700 	sub	a, -25 (ix)
   43EF DD 7E EC      [19]  701 	ld	a,-20 (ix)
   43F2 DD 9E E8      [19]  702 	sbc	a, -24 (ix)
   43F5 E2 FA 43      [10]  703 	jp	PO, 00312$
   43F8 EE 80         [ 7]  704 	xor	a, #0x80
   43FA                     705 00312$:
   43FA FA 28 44      [10]  706 	jp	M,00167$
                            707 ;src/pathfinding.c:119: resultado = 3;
   43FD DD 36 EF 03   [19]  708 	ld	-17 (ix),#0x03
   4401 18 25         [12]  709 	jr	00167$
   4403                     710 00161$:
                            711 ;src/pathfinding.c:120: }else if (resultado == 2){
   4403 DD 7E EF      [19]  712 	ld	a,-17 (ix)
   4406 D6 02         [ 7]  713 	sub	a, #0x02
   4408 20 1A         [12]  714 	jr	NZ,00158$
                            715 ;src/pathfinding.c:121: if(dist3 >= dist4)
   440A DD 7E E9      [19]  716 	ld	a,-23 (ix)
   440D DD 96 E7      [19]  717 	sub	a, -25 (ix)
   4410 DD 7E EA      [19]  718 	ld	a,-22 (ix)
   4413 DD 9E E8      [19]  719 	sbc	a, -24 (ix)
   4416 E2 1B 44      [10]  720 	jp	PO, 00315$
   4419 EE 80         [ 7]  721 	xor	a, #0x80
   441B                     722 00315$:
   441B FA 28 44      [10]  723 	jp	M,00167$
                            724 ;src/pathfinding.c:122: resultado = 3;
   441E DD 36 EF 03   [19]  725 	ld	-17 (ix),#0x03
   4422 18 04         [12]  726 	jr	00167$
   4424                     727 00158$:
                            728 ;src/pathfinding.c:124: resultado = 3;
   4424 DD 36 EF 03   [19]  729 	ld	-17 (ix),#0x03
   4428                     730 00167$:
                            731 ;src/pathfinding.c:128: return resultado;
   4428 DD 6E EF      [19]  732 	ld	l,-17 (ix)
   442B DD F9         [10]  733 	ld	sp, ix
   442D DD E1         [14]  734 	pop	ix
   442F C9            [10]  735 	ret
                            736 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            737 ;	---------------------------------
                            738 ; Function pathFinding
                            739 ; ---------------------------------
   4430                     740 _pathFinding::
   4430 DD E5         [15]  741 	push	ix
   4432 DD 21 00 00   [14]  742 	ld	ix,#0
   4436 DD 39         [15]  743 	add	ix,sp
   4438 21 ED FF      [10]  744 	ld	hl,#-19
   443B 39            [11]  745 	add	hl,sp
   443C F9            [ 6]  746 	ld	sp,hl
                            747 ;src/pathfinding.c:144: u8 problem = 0;
   443D DD 36 ED 00   [19]  748 	ld	-19 (ix),#0x00
                            749 ;src/pathfinding.c:146: x = s_x;
   4441 DD 7E 04      [19]  750 	ld	a,4 (ix)
   4444 DD 77 F2      [19]  751 	ld	-14 (ix),a
                            752 ;src/pathfinding.c:147: sol_tam = 0;
   4447 21 FB 62      [10]  753 	ld	hl,#_sol_tam + 0
   444A 36 00         [10]  754 	ld	(hl), #0x00
                            755 ;src/pathfinding.c:148: y = s_y;
   444C DD 7E 05      [19]  756 	ld	a,5 (ix)
   444F DD 77 F1      [19]  757 	ld	-15 (ix),a
                            758 ;src/pathfinding.c:150: k = 0;
   4452 DD 36 F3 00   [19]  759 	ld	-13 (ix),#0x00
                            760 ;src/pathfinding.c:151: aux = 1;
   4456 DD 36 EE 01   [19]  761 	ld	-18 (ix),#0x01
                            762 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   445A DD 7E 08      [19]  763 	ld	a,8 (ix)
   445D DD 77 FC      [19]  764 	ld	-4 (ix),a
   4460 DD 7E 09      [19]  765 	ld	a,9 (ix)
   4463 DD 77 FD      [19]  766 	ld	-3 (ix),a
   4466 DD 7E FC      [19]  767 	ld	a,-4 (ix)
   4469 C6 E2         [ 7]  768 	add	a, #0xE2
   446B DD 77 FA      [19]  769 	ld	-6 (ix),a
   446E DD 7E FD      [19]  770 	ld	a,-3 (ix)
   4471 CE 00         [ 7]  771 	adc	a, #0x00
   4473 DD 77 FB      [19]  772 	ld	-5 (ix),a
   4476 DD 6E FA      [19]  773 	ld	l,-6 (ix)
   4479 DD 66 FB      [19]  774 	ld	h,-5 (ix)
   447C 36 00         [10]  775 	ld	(hl),#0x00
                            776 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   447E DD 66 F1      [19]  777 	ld	h,-15 (ix)
   4481 DD 6E F2      [19]  778 	ld	l,-14 (ix)
   4484 E5            [11]  779 	push	hl
   4485 CD 0A 3F      [17]  780 	call	_anyadirALista
   4488 F1            [10]  781 	pop	af
   4489 DD 75 F0      [19]  782 	ld	-16 (ix),l
                            783 ;src/pathfinding.c:156: if(!(x == f_x && y == f_y) ){
   448C DD 7E 06      [19]  784 	ld	a,6 (ix)
   448F DD 96 F2      [19]  785 	sub	a, -14 (ix)
   4492 20 09         [12]  786 	jr	NZ,00114$
   4494 DD 7E 07      [19]  787 	ld	a,7 (ix)
   4497 DD 96 F1      [19]  788 	sub	a, -15 (ix)
   449A CA A4 45      [10]  789 	jp	Z,00118$
                            790 ;src/pathfinding.c:157: while (aux){
   449D                     791 00114$:
   449D DD 7E EE      [19]  792 	ld	a,-18 (ix)
   44A0 B7            [ 4]  793 	or	a, a
   44A1 CA A8 45      [10]  794 	jp	Z,00119$
                            795 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   44A4 DD 7E 06      [19]  796 	ld	a,6 (ix)
   44A7 DD 96 F2      [19]  797 	sub	a, -14 (ix)
   44AA 20 08         [12]  798 	jr	NZ,00113$
   44AC DD 7E 07      [19]  799 	ld	a,7 (ix)
   44AF DD 96 F1      [19]  800 	sub	a, -15 (ix)
   44B2 28 06         [12]  801 	jr	Z,00109$
   44B4                     802 00113$:
   44B4 DD 7E F0      [19]  803 	ld	a,-16 (ix)
   44B7 B7            [ 4]  804 	or	a, a
   44B8 20 16         [12]  805 	jr	NZ,00110$
   44BA                     806 00109$:
                            807 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   44BA DD 7E F0      [19]  808 	ld	a,-16 (ix)
   44BD B7            [ 4]  809 	or	a, a
   44BE 28 06         [12]  810 	jr	Z,00101$
   44C0 3A FB 62      [13]  811 	ld	a,(#_sol_tam + 0)
   44C3 B7            [ 4]  812 	or	a, a
   44C4 20 04         [12]  813 	jr	NZ,00102$
   44C6                     814 00101$:
                            815 ;src/pathfinding.c:161: problem = 1;
   44C6 DD 36 ED 01   [19]  816 	ld	-19 (ix),#0x01
   44CA                     817 00102$:
                            818 ;src/pathfinding.c:164: aux = 0;
   44CA DD 36 EE 00   [19]  819 	ld	-18 (ix),#0x00
   44CE 18 CD         [12]  820 	jr	00114$
   44D0                     821 00110$:
                            822 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   44D0 DD 6E 0A      [19]  823 	ld	l,10 (ix)
   44D3 DD 66 0B      [19]  824 	ld	h,11 (ix)
   44D6 E5            [11]  825 	push	hl
   44D7 DD 66 07      [19]  826 	ld	h,7 (ix)
   44DA DD 6E 06      [19]  827 	ld	l,6 (ix)
   44DD E5            [11]  828 	push	hl
   44DE DD 66 F1      [19]  829 	ld	h,-15 (ix)
   44E1 DD 6E F2      [19]  830 	ld	l,-14 (ix)
   44E4 E5            [11]  831 	push	hl
   44E5 CD 52 3F      [17]  832 	call	_adjacentTiles
   44E8 F1            [10]  833 	pop	af
   44E9 F1            [10]  834 	pop	af
   44EA F1            [10]  835 	pop	af
   44EB DD 75 EF      [19]  836 	ld	-17 (ix),l
                            837 ;src/pathfinding.c:168: switch(movimiento){
   44EE 3E 03         [ 7]  838 	ld	a,#0x03
   44F0 DD 96 EF      [19]  839 	sub	a, -17 (ix)
   44F3 38 A8         [12]  840 	jr	C,00114$
                            841 ;src/pathfinding.c:172: k = k+2;
   44F5 DD 7E F3      [19]  842 	ld	a,-13 (ix)
   44F8 C6 02         [ 7]  843 	add	a, #0x02
   44FA DD 77 FF      [19]  844 	ld	-1 (ix),a
                            845 ;src/pathfinding.c:168: switch(movimiento){
   44FD DD 5E EF      [19]  846 	ld	e,-17 (ix)
   4500 16 00         [ 7]  847 	ld	d,#0x00
   4502 21 08 45      [10]  848 	ld	hl,#00180$
   4505 19            [11]  849 	add	hl,de
   4506 19            [11]  850 	add	hl,de
                            851 ;src/pathfinding.c:169: case 0:
   4507 E9            [ 4]  852 	jp	(hl)
   4508                     853 00180$:
   4508 18 06         [12]  854 	jr	00104$
   450A 18 2C         [12]  855 	jr	00105$
   450C 18 52         [12]  856 	jr	00106$
   450E 18 70         [12]  857 	jr	00107$
   4510                     858 00104$:
                            859 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4510 DD 7E F1      [19]  860 	ld	a,-15 (ix)
   4513 C6 FE         [ 7]  861 	add	a,#0xFE
   4515 DD 77 F9      [19]  862 	ld	-7 (ix), a
   4518 F5            [11]  863 	push	af
   4519 33            [ 6]  864 	inc	sp
   451A DD 7E F2      [19]  865 	ld	a,-14 (ix)
   451D F5            [11]  866 	push	af
   451E 33            [ 6]  867 	inc	sp
   451F CD 0A 3F      [17]  868 	call	_anyadirALista
   4522 F1            [10]  869 	pop	af
   4523 DD 75 FE      [19]  870 	ld	-2 (ix), l
   4526 DD 75 F0      [19]  871 	ld	-16 (ix), l
                            872 ;src/pathfinding.c:171: y = y-2;
   4529 DD 4E F9      [19]  873 	ld	c,-7 (ix)
   452C DD 71 F1      [19]  874 	ld	-15 (ix),c
                            875 ;src/pathfinding.c:172: k = k+2;
   452F DD 7E FF      [19]  876 	ld	a,-1 (ix)
   4532 DD 77 F3      [19]  877 	ld	-13 (ix),a
                            878 ;src/pathfinding.c:173: break;
   4535 C3 9D 44      [10]  879 	jp	00114$
                            880 ;src/pathfinding.c:174: case 1:
   4538                     881 00105$:
                            882 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   4538 DD 7E F1      [19]  883 	ld	a,-15 (ix)
   453B C6 02         [ 7]  884 	add	a, #0x02
   453D DD 77 FE      [19]  885 	ld	-2 (ix), a
   4540 F5            [11]  886 	push	af
   4541 33            [ 6]  887 	inc	sp
   4542 DD 7E F2      [19]  888 	ld	a,-14 (ix)
   4545 F5            [11]  889 	push	af
   4546 33            [ 6]  890 	inc	sp
   4547 CD 0A 3F      [17]  891 	call	_anyadirALista
   454A F1            [10]  892 	pop	af
   454B DD 75 F9      [19]  893 	ld	-7 (ix), l
   454E DD 75 F0      [19]  894 	ld	-16 (ix), l
                            895 ;src/pathfinding.c:178: y = y+2;
   4551 DD 4E FE      [19]  896 	ld	c,-2 (ix)
   4554 DD 71 F1      [19]  897 	ld	-15 (ix),c
                            898 ;src/pathfinding.c:179: k = k+2;
   4557 DD 7E FF      [19]  899 	ld	a,-1 (ix)
   455A DD 77 F3      [19]  900 	ld	-13 (ix),a
                            901 ;src/pathfinding.c:180: break;
   455D C3 9D 44      [10]  902 	jp	00114$
                            903 ;src/pathfinding.c:181: case 2:
   4560                     904 00106$:
                            905 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4560 DD 46 F2      [19]  906 	ld	b,-14 (ix)
   4563 05            [ 4]  907 	dec	b
   4564 C5            [11]  908 	push	bc
   4565 DD 7E F1      [19]  909 	ld	a,-15 (ix)
   4568 F5            [11]  910 	push	af
   4569 33            [ 6]  911 	inc	sp
   456A C5            [11]  912 	push	bc
   456B 33            [ 6]  913 	inc	sp
   456C CD 0A 3F      [17]  914 	call	_anyadirALista
   456F F1            [10]  915 	pop	af
   4570 C1            [10]  916 	pop	bc
   4571 DD 75 F0      [19]  917 	ld	-16 (ix),l
                            918 ;src/pathfinding.c:185: x = x-1;
   4574 DD 70 F2      [19]  919 	ld	-14 (ix),b
                            920 ;src/pathfinding.c:186: k = k+2;
   4577 DD 7E FF      [19]  921 	ld	a,-1 (ix)
   457A DD 77 F3      [19]  922 	ld	-13 (ix),a
                            923 ;src/pathfinding.c:187: break;
   457D C3 9D 44      [10]  924 	jp	00114$
                            925 ;src/pathfinding.c:188: case 3:
   4580                     926 00107$:
                            927 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4580 DD 7E F2      [19]  928 	ld	a,-14 (ix)
   4583 3C            [ 4]  929 	inc	a
   4584 DD 77 FE      [19]  930 	ld	-2 (ix),a
   4587 DD 66 F1      [19]  931 	ld	h,-15 (ix)
   458A DD 6E FE      [19]  932 	ld	l,-2 (ix)
   458D E5            [11]  933 	push	hl
   458E CD 0A 3F      [17]  934 	call	_anyadirALista
   4591 F1            [10]  935 	pop	af
   4592 DD 75 F0      [19]  936 	ld	-16 (ix),l
                            937 ;src/pathfinding.c:190: x = x+1;
   4595 DD 7E FE      [19]  938 	ld	a,-2 (ix)
   4598 DD 77 F2      [19]  939 	ld	-14 (ix),a
                            940 ;src/pathfinding.c:191: k = k+2;
   459B DD 7E FF      [19]  941 	ld	a,-1 (ix)
   459E DD 77 F3      [19]  942 	ld	-13 (ix),a
                            943 ;src/pathfinding.c:194: }
   45A1 C3 9D 44      [10]  944 	jp	00114$
   45A4                     945 00118$:
                            946 ;src/pathfinding.c:199: problem = 1;
   45A4 DD 36 ED 01   [19]  947 	ld	-19 (ix),#0x01
   45A8                     948 00119$:
                            949 ;src/pathfinding.c:201: if(problem == 0){
   45A8 DD 7E ED      [19]  950 	ld	a,-19 (ix)
   45AB B7            [ 4]  951 	or	a, a
   45AC 20 74         [12]  952 	jr	NZ,00126$
                            953 ;src/pathfinding.c:202: if(sol_tam < CAMINO_TAM){
   45AE 3A FB 62      [13]  954 	ld	a,(#_sol_tam + 0)
   45B1 D6 C8         [ 7]  955 	sub	a, #0xC8
   45B3 30 0C         [12]  956 	jr	NC,00122$
                            957 ;src/pathfinding.c:203: actual->longitud_camino = sol_tam;
   45B5 DD 6E FA      [19]  958 	ld	l,-6 (ix)
   45B8 DD 66 FB      [19]  959 	ld	h,-5 (ix)
   45BB 3A FB 62      [13]  960 	ld	a,(#_sol_tam + 0)
   45BE 77            [ 7]  961 	ld	(hl),a
   45BF 18 08         [12]  962 	jr	00142$
   45C1                     963 00122$:
                            964 ;src/pathfinding.c:205: actual->longitud_camino = CAMINO_TAM;
   45C1 DD 6E FA      [19]  965 	ld	l,-6 (ix)
   45C4 DD 66 FB      [19]  966 	ld	h,-5 (ix)
   45C7 36 C8         [10]  967 	ld	(hl),#0xC8
                            968 ;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
   45C9                     969 00142$:
   45C9 DD 7E FC      [19]  970 	ld	a,-4 (ix)
   45CC C6 1A         [ 7]  971 	add	a, #0x1A
   45CE DD 77 FC      [19]  972 	ld	-4 (ix),a
   45D1 DD 7E FD      [19]  973 	ld	a,-3 (ix)
   45D4 CE 00         [ 7]  974 	adc	a, #0x00
   45D6 DD 77 FD      [19]  975 	ld	-3 (ix),a
   45D9 DD 36 F4 00   [19]  976 	ld	-12 (ix),#0x00
   45DD                     977 00129$:
   45DD DD 6E FA      [19]  978 	ld	l,-6 (ix)
   45E0 DD 66 FB      [19]  979 	ld	h,-5 (ix)
   45E3 DD 7E F4      [19]  980 	ld	a,-12 (ix)
   45E6 96            [ 7]  981 	sub	a,(hl)
   45E7 30 41         [12]  982 	jr	NC,00131$
                            983 ;src/pathfinding.c:208: actual->camino[i] = camino[i];
   45E9 DD 7E F4      [19]  984 	ld	a,-12 (ix)
   45EC DD 86 FC      [19]  985 	add	a, -4 (ix)
   45EF DD 77 F5      [19]  986 	ld	-11 (ix),a
   45F2 3E 00         [ 7]  987 	ld	a,#0x00
   45F4 DD 8E FD      [19]  988 	adc	a, -3 (ix)
   45F7 DD 77 F6      [19]  989 	ld	-10 (ix),a
   45FA 3E FC         [ 7]  990 	ld	a,#<(_camino)
   45FC DD 86 F4      [19]  991 	add	a, -12 (ix)
   45FF DD 77 F7      [19]  992 	ld	-9 (ix),a
   4602 3E 62         [ 7]  993 	ld	a,#>(_camino)
   4604 CE 00         [ 7]  994 	adc	a, #0x00
   4606 DD 77 F8      [19]  995 	ld	-8 (ix),a
   4609 DD 6E F7      [19]  996 	ld	l,-9 (ix)
   460C DD 66 F8      [19]  997 	ld	h,-8 (ix)
   460F 7E            [ 7]  998 	ld	a,(hl)
   4610 DD 77 F7      [19]  999 	ld	-9 (ix),a
   4613 DD 6E F5      [19] 1000 	ld	l,-11 (ix)
   4616 DD 66 F6      [19] 1001 	ld	h,-10 (ix)
   4619 DD 7E F7      [19] 1002 	ld	a,-9 (ix)
   461C 77            [ 7] 1003 	ld	(hl),a
                           1004 ;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
   461D DD 34 F4      [23] 1005 	inc	-12 (ix)
   4620 18 BB         [12] 1006 	jr	00129$
   4622                    1007 00126$:
                           1008 ;src/pathfinding.c:212: actual->longitud_camino = 0;
   4622 DD 6E FA      [19] 1009 	ld	l,-6 (ix)
   4625 DD 66 FB      [19] 1010 	ld	h,-5 (ix)
   4628 36 00         [10] 1011 	ld	(hl),#0x00
   462A                    1012 00131$:
   462A DD F9         [10] 1013 	ld	sp, ix
   462C DD E1         [14] 1014 	pop	ix
   462E C9            [10] 1015 	ret
                           1016 	.area _CODE
                           1017 	.area _INITIALIZER
                           1018 	.area _CABS (ABS)
