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
   62FC                      26 _sol_tam::
   62FC                      27 	.ds 1
   62FD                      28 _camino::
   62FD                      29 	.ds 200
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
   3F0C 3A FC 62      [13]   62 	ld	a,(#_sol_tam + 0)
   3F0F D6 C8         [ 7]   63 	sub	a, #0xC8
   3F11 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   3F13 01 FD 62      [10]   66 	ld	bc,#_camino+0
   3F16 2A FC 62      [16]   67 	ld	hl,(_sol_tam)
   3F19 26 00         [ 7]   68 	ld	h,#0x00
   3F1B 09            [11]   69 	add	hl,bc
   3F1C FD 21 02 00   [14]   70 	ld	iy,#2
   3F20 FD 39         [15]   71 	add	iy,sp
   3F22 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3F25 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   3F26 21 FC 62      [10]   75 	ld	hl, #_sol_tam+0
   3F29 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   3F2A 2A FC 62      [16]   78 	ld	hl,(_sol_tam)
   3F2D 26 00         [ 7]   79 	ld	h,#0x00
   3F2F 09            [11]   80 	add	hl,bc
   3F30 FD 21 03 00   [14]   81 	ld	iy,#3
   3F34 FD 39         [15]   82 	add	iy,sp
   3F36 FD 7E 00      [19]   83 	ld	a,0 (iy)
   3F39 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   3F3A 21 FC 62      [10]   86 	ld	hl, #_sol_tam+0
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
   3F5A 21 E1 FF      [10]  111 	ld	hl,#-31
   3F5D 39            [11]  112 	add	hl,sp
   3F5E F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   3F5F DD 36 F1 04   [19]  115 	ld	-15 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   3F63 DD 36 EF 00   [19]  117 	ld	-17 (ix),#0x00
   3F67 DD 36 F0 00   [19]  118 	ld	-16 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   3F6B DD 36 ED 00   [19]  120 	ld	-19 (ix),#0x00
   3F6F DD 36 EE 00   [19]  121 	ld	-18 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   3F73 DD 36 EB 00   [19]  123 	ld	-21 (ix),#0x00
   3F77 DD 36 EC 00   [19]  124 	ld	-20 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   3F7B DD 36 E7 00   [19]  126 	ld	-25 (ix),#0x00
   3F7F DD 36 E8 00   [19]  127 	ld	-24 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   3F83 21 00 00      [10]  129 	ld	hl,#0x0000
   3F86 E3            [19]  130 	ex	(sp), hl
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   3F87 DD 36 E3 00   [19]  132 	ld	-29 (ix),#0x00
   3F8B DD 36 E4 00   [19]  133 	ld	-28 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   3F8F DD 36 E5 00   [19]  135 	ld	-27 (ix),#0x00
   3F93 DD 36 E6 00   [19]  136 	ld	-26 (ix),#0x00
                            137 ;src/pathfinding.c:43: if(y < f_y)
   3F97 DD 7E 05      [19]  138 	ld	a,5 (ix)
   3F9A DD 96 07      [19]  139 	sub	a, 7 (ix)
   3F9D 3E 00         [ 7]  140 	ld	a,#0x00
   3F9F 17            [ 4]  141 	rla
   3FA0 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   3FA1 DD 7E 04      [19]  144 	ld	a,4 (ix)
   3FA4 DD 96 06      [19]  145 	sub	a, 6 (ix)
   3FA7 20 20         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   3FA9 79            [ 4]  148 	ld	a,c
   3FAA B7            [ 4]  149 	or	a, a
   3FAB 28 08         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   3FAD DD 36 E5 FF   [19]  152 	ld	-27 (ix),#0xFF
   3FB1 DD 36 E6 FF   [19]  153 	ld	-26 (ix),#0xFF
   3FB5                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   3FB5 DD 7E 07      [19]  156 	ld	a,7 (ix)
   3FB8 DD 96 05      [19]  157 	sub	a, 5 (ix)
   3FBB D2 3D 40      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   3FBE DD 36 E3 FF   [19]  160 	ld	-29 (ix),#0xFF
   3FC2 DD 36 E4 FF   [19]  161 	ld	-28 (ix),#0xFF
   3FC6 C3 3D 40      [10]  162 	jp	00125$
   3FC9                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   3FC9 DD 7E 04      [19]  165 	ld	a,4 (ix)
   3FCC DD 96 06      [19]  166 	sub	a, 6 (ix)
   3FCF 3E 00         [ 7]  167 	ld	a,#0x00
   3FD1 17            [ 4]  168 	rla
   3FD2 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   3FD3 DD 7E 06      [19]  171 	ld	a,6 (ix)
   3FD6 DD 96 04      [19]  172 	sub	a, 4 (ix)
   3FD9 3E 00         [ 7]  173 	ld	a,#0x00
   3FDB 17            [ 4]  174 	rla
   3FDC 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   3FDD DD 7E 05      [19]  177 	ld	a,5 (ix)
   3FE0 DD 96 07      [19]  178 	sub	a, 7 (ix)
   3FE3 20 16         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   3FE5 78            [ 4]  181 	ld	a,b
   3FE6 B7            [ 4]  182 	or	a, a
   3FE7 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   3FE9 DD 36 E7 FF   [19]  185 	ld	-25 (ix),#0xFF
   3FED DD 36 E8 FF   [19]  186 	ld	-24 (ix),#0xFF
   3FF1                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   3FF1 7B            [ 4]  189 	ld	a,e
   3FF2 B7            [ 4]  190 	or	a, a
   3FF3 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   3FF5 21 FF FF      [10]  193 	ld	hl,#0xFFFF
   3FF8 E3            [19]  194 	ex	(sp), hl
   3FF9 18 42         [12]  195 	jr	00125$
   3FFB                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   3FFB 78            [ 4]  198 	ld	a,b
   3FFC B7            [ 4]  199 	or	a, a
   3FFD 28 20         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   3FFF 79            [ 4]  202 	ld	a,c
   4000 B7            [ 4]  203 	or	a, a
   4001 28 0A         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   4003 DD 36 E5 FF   [19]  206 	ld	-27 (ix),#0xFF
   4007 DD 36 E6 FF   [19]  207 	ld	-26 (ix),#0xFF
   400B 18 08         [12]  208 	jr	00111$
   400D                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   400D DD 36 E3 FF   [19]  211 	ld	-29 (ix),#0xFF
   4011 DD 36 E4 FF   [19]  212 	ld	-28 (ix),#0xFF
   4015                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4015 DD 36 E7 FF   [19]  215 	ld	-25 (ix),#0xFF
   4019 DD 36 E8 FF   [19]  216 	ld	-24 (ix),#0xFF
   401D 18 1E         [12]  217 	jr	00125$
   401F                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   401F 7B            [ 4]  220 	ld	a,e
   4020 B7            [ 4]  221 	or	a, a
   4021 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4023 79            [ 4]  224 	ld	a,c
   4024 B7            [ 4]  225 	or	a, a
   4025 28 0A         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   4027 DD 36 E5 FF   [19]  228 	ld	-27 (ix),#0xFF
   402B DD 36 E6 FF   [19]  229 	ld	-26 (ix),#0xFF
   402F 18 08         [12]  230 	jr	00114$
   4031                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4031 DD 36 E3 FF   [19]  233 	ld	-29 (ix),#0xFF
   4035 DD 36 E4 FF   [19]  234 	ld	-28 (ix),#0xFF
   4039                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4039 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   403C E3            [19]  238 	ex	(sp), hl
   403D                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   403D DD 46 05      [19]  241 	ld	b,5 (ix)
   4040 05            [ 4]  242 	dec	b
   4041 05            [ 4]  243 	dec	b
   4042 C5            [11]  244 	push	bc
   4043 33            [ 6]  245 	inc	sp
   4044 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4047 F5            [11]  247 	push	af
   4048 33            [ 6]  248 	inc	sp
   4049 DD 6E 08      [19]  249 	ld	l,8 (ix)
   404C DD 66 09      [19]  250 	ld	h,9 (ix)
   404F E5            [11]  251 	push	hl
   4050 CD 1C 4A      [17]  252 	call	_getTilePtr
   4053 F1            [10]  253 	pop	af
   4054 F1            [10]  254 	pop	af
   4055 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4056 DD 7E 06      [19]  257 	ld	a,6 (ix)
   4059 DD 77 F8      [19]  258 	ld	-8 (ix),a
   405C DD 36 F9 00   [19]  259 	ld	-7 (ix),#0x00
   4060 DD 7E 04      [19]  260 	ld	a,4 (ix)
   4063 DD 77 F4      [19]  261 	ld	-12 (ix),a
   4066 DD 36 F5 00   [19]  262 	ld	-11 (ix),#0x00
   406A DD 7E 07      [19]  263 	ld	a,7 (ix)
   406D DD 77 F6      [19]  264 	ld	-10 (ix),a
   4070 DD 36 F7 00   [19]  265 	ld	-9 (ix),#0x00
   4074 DD 7E 05      [19]  266 	ld	a,5 (ix)
   4077 DD 77 FE      [19]  267 	ld	-2 (ix),a
   407A DD 36 FF 00   [19]  268 	ld	-1 (ix),#0x00
   407E DD 7E F8      [19]  269 	ld	a,-8 (ix)
   4081 DD 96 F4      [19]  270 	sub	a, -12 (ix)
   4084 DD 77 F2      [19]  271 	ld	-14 (ix),a
   4087 DD 7E F9      [19]  272 	ld	a,-7 (ix)
   408A DD 9E F5      [19]  273 	sbc	a, -11 (ix)
   408D DD 77 F3      [19]  274 	ld	-13 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4090 3E 02         [ 7]  276 	ld	a,#0x02
   4092 91            [ 4]  277 	sub	a, c
   4093 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4095 DD 6E F2      [19]  280 	ld	l,-14 (ix)
   4098 DD 66 F3      [19]  281 	ld	h,-13 (ix)
   409B E5            [11]  282 	push	hl
   409C CD 60 4A      [17]  283 	call	_abs
   409F F1            [10]  284 	pop	af
   40A0 DD 74 FD      [19]  285 	ld	-3 (ix),h
   40A3 DD 75 FC      [19]  286 	ld	-4 (ix),l
   40A6 DD 4E FE      [19]  287 	ld	c,-2 (ix)
   40A9 DD 46 FF      [19]  288 	ld	b,-1 (ix)
   40AC 0B            [ 6]  289 	dec	bc
   40AD 0B            [ 6]  290 	dec	bc
   40AE DD 7E F6      [19]  291 	ld	a,-10 (ix)
   40B1 91            [ 4]  292 	sub	a, c
   40B2 4F            [ 4]  293 	ld	c,a
   40B3 DD 7E F7      [19]  294 	ld	a,-9 (ix)
   40B6 98            [ 4]  295 	sbc	a, b
   40B7 47            [ 4]  296 	ld	b,a
   40B8 C5            [11]  297 	push	bc
   40B9 CD 60 4A      [17]  298 	call	_abs
   40BC F1            [10]  299 	pop	af
   40BD DD 74 FB      [19]  300 	ld	-5 (ix),h
   40C0 DD 75 FA      [19]  301 	ld	-6 (ix),l
   40C3 DD 7E FC      [19]  302 	ld	a,-4 (ix)
   40C6 DD 86 FA      [19]  303 	add	a, -6 (ix)
   40C9 DD 77 FA      [19]  304 	ld	-6 (ix),a
   40CC DD 7E FD      [19]  305 	ld	a,-3 (ix)
   40CF DD 8E FB      [19]  306 	adc	a, -5 (ix)
   40D2 DD 77 FB      [19]  307 	ld	-5 (ix),a
   40D5 DD 7E FA      [19]  308 	ld	a,-6 (ix)
   40D8 DD 86 E3      [19]  309 	add	a, -29 (ix)
   40DB DD 77 FA      [19]  310 	ld	-6 (ix),a
   40DE DD 7E FB      [19]  311 	ld	a,-5 (ix)
   40E1 DD 8E E4      [19]  312 	adc	a, -28 (ix)
   40E4 DD 77 FB      [19]  313 	ld	-5 (ix),a
   40E7 DD 7E FA      [19]  314 	ld	a,-6 (ix)
   40EA DD 77 EF      [19]  315 	ld	-17 (ix),a
   40ED DD 7E FB      [19]  316 	ld	a,-5 (ix)
   40F0 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   40F3 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   40F7                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 /*&&
   40F7 DD 46 05      [19]  322 	ld	b,5 (ix)
   40FA 04            [ 4]  323 	inc	b
   40FB 04            [ 4]  324 	inc	b
   40FC C5            [11]  325 	push	bc
   40FD 33            [ 6]  326 	inc	sp
   40FE DD 7E 04      [19]  327 	ld	a,4 (ix)
   4101 F5            [11]  328 	push	af
   4102 33            [ 6]  329 	inc	sp
   4103 DD 6E 08      [19]  330 	ld	l,8 (ix)
   4106 DD 66 09      [19]  331 	ld	h,9 (ix)
   4109 E5            [11]  332 	push	hl
   410A CD 1C 4A      [17]  333 	call	_getTilePtr
   410D F1            [10]  334 	pop	af
   410E F1            [10]  335 	pop	af
   410F 4E            [ 7]  336 	ld	c,(hl)
   4110 3E 02         [ 7]  337 	ld	a,#0x02
   4112 91            [ 4]  338 	sub	a, c
   4113 DA AE 41      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4116 DD 6E F2      [19]  341 	ld	l,-14 (ix)
   4119 DD 66 F3      [19]  342 	ld	h,-13 (ix)
   411C E5            [11]  343 	push	hl
   411D CD 60 4A      [17]  344 	call	_abs
   4120 F1            [10]  345 	pop	af
   4121 DD 74 FB      [19]  346 	ld	-5 (ix),h
   4124 DD 75 FA      [19]  347 	ld	-6 (ix),l
   4127 DD 7E FE      [19]  348 	ld	a,-2 (ix)
   412A C6 02         [ 7]  349 	add	a, #0x02
   412C DD 77 FC      [19]  350 	ld	-4 (ix),a
   412F DD 7E FF      [19]  351 	ld	a,-1 (ix)
   4132 CE 00         [ 7]  352 	adc	a, #0x00
   4134 DD 77 FD      [19]  353 	ld	-3 (ix),a
   4137 DD 7E F6      [19]  354 	ld	a,-10 (ix)
   413A DD 96 FC      [19]  355 	sub	a, -4 (ix)
   413D DD 77 FC      [19]  356 	ld	-4 (ix),a
   4140 DD 7E F7      [19]  357 	ld	a,-9 (ix)
   4143 DD 9E FD      [19]  358 	sbc	a, -3 (ix)
   4146 DD 77 FD      [19]  359 	ld	-3 (ix),a
   4149 DD 6E FC      [19]  360 	ld	l,-4 (ix)
   414C DD 66 FD      [19]  361 	ld	h,-3 (ix)
   414F E5            [11]  362 	push	hl
   4150 CD 60 4A      [17]  363 	call	_abs
   4153 F1            [10]  364 	pop	af
   4154 DD 74 FD      [19]  365 	ld	-3 (ix),h
   4157 DD 75 FC      [19]  366 	ld	-4 (ix),l
   415A DD 7E FA      [19]  367 	ld	a,-6 (ix)
   415D DD 86 FC      [19]  368 	add	a, -4 (ix)
   4160 DD 77 FA      [19]  369 	ld	-6 (ix),a
   4163 DD 7E FB      [19]  370 	ld	a,-5 (ix)
   4166 DD 8E FD      [19]  371 	adc	a, -3 (ix)
   4169 DD 77 FB      [19]  372 	ld	-5 (ix),a
   416C DD 7E E5      [19]  373 	ld	a,-27 (ix)
   416F DD 86 FA      [19]  374 	add	a, -6 (ix)
   4172 DD 77 FA      [19]  375 	ld	-6 (ix),a
   4175 DD 7E E6      [19]  376 	ld	a,-26 (ix)
   4178 DD 8E FB      [19]  377 	adc	a, -5 (ix)
   417B DD 77 FB      [19]  378 	ld	-5 (ix),a
   417E DD 7E FA      [19]  379 	ld	a,-6 (ix)
   4181 DD 77 ED      [19]  380 	ld	-19 (ix),a
   4184 DD 7E FB      [19]  381 	ld	a,-5 (ix)
   4187 DD 77 EE      [19]  382 	ld	-18 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   418A DD 7E F1      [19]  384 	ld	a,-15 (ix)
   418D B7            [ 4]  385 	or	a, a
   418E 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   4190 DD 7E ED      [19]  388 	ld	a,-19 (ix)
   4193 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   4196 DD 7E EE      [19]  390 	ld	a,-18 (ix)
   4199 DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   419C E2 A1 41      [10]  392 	jp	PO, 00274$
   419F EE 80         [ 7]  393 	xor	a, #0x80
   41A1                     394 00274$:
   41A1 F2 AE 41      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   41A4 DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   41A8 18 04         [12]  398 	jr	00134$
   41AA                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   41AA DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   41AE                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41AE DD 46 04      [19]  404 	ld	b,4 (ix)
   41B1 05            [ 4]  405 	dec	b
   41B2 DD 7E 05      [19]  406 	ld	a,5 (ix)
   41B5 F5            [11]  407 	push	af
   41B6 33            [ 6]  408 	inc	sp
   41B7 C5            [11]  409 	push	bc
   41B8 33            [ 6]  410 	inc	sp
   41B9 DD 6E 08      [19]  411 	ld	l,8 (ix)
   41BC DD 66 09      [19]  412 	ld	h,9 (ix)
   41BF E5            [11]  413 	push	hl
   41C0 CD 1C 4A      [17]  414 	call	_getTilePtr
   41C3 F1            [10]  415 	pop	af
   41C4 F1            [10]  416 	pop	af
   41C5 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41C6 DD 7E F6      [19]  419 	ld	a,-10 (ix)
   41C9 DD 96 FE      [19]  420 	sub	a, -2 (ix)
   41CC DD 77 FA      [19]  421 	ld	-6 (ix),a
   41CF DD 7E F7      [19]  422 	ld	a,-9 (ix)
   41D2 DD 9E FF      [19]  423 	sbc	a, -1 (ix)
   41D5 DD 77 FB      [19]  424 	ld	-5 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41D8 3E 02         [ 7]  426 	ld	a,#0x02
   41DA 91            [ 4]  427 	sub	a, c
   41DB 38 70         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41DD DD 4E F4      [19]  430 	ld	c,-12 (ix)
   41E0 DD 46 F5      [19]  431 	ld	b,-11 (ix)
   41E3 0B            [ 6]  432 	dec	bc
   41E4 DD 7E F8      [19]  433 	ld	a,-8 (ix)
   41E7 91            [ 4]  434 	sub	a, c
   41E8 4F            [ 4]  435 	ld	c,a
   41E9 DD 7E F9      [19]  436 	ld	a,-7 (ix)
   41EC 98            [ 4]  437 	sbc	a, b
   41ED 47            [ 4]  438 	ld	b,a
   41EE C5            [11]  439 	push	bc
   41EF CD 60 4A      [17]  440 	call	_abs
   41F2 E3            [19]  441 	ex	(sp),hl
   41F3 DD 6E FA      [19]  442 	ld	l,-6 (ix)
   41F6 DD 66 FB      [19]  443 	ld	h,-5 (ix)
   41F9 E5            [11]  444 	push	hl
   41FA CD 60 4A      [17]  445 	call	_abs
   41FD F1            [10]  446 	pop	af
   41FE C1            [10]  447 	pop	bc
   41FF 09            [11]  448 	add	hl,bc
   4200 D1            [10]  449 	pop	de
   4201 D5            [11]  450 	push	de
   4202 19            [11]  451 	add	hl,de
   4203 DD 75 EB      [19]  452 	ld	-21 (ix),l
   4206 DD 74 EC      [19]  453 	ld	-20 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   4209 DD 7E F1      [19]  455 	ld	a,-15 (ix)
   420C B7            [ 4]  456 	or	a, a
   420D 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   420F DD 7E EF      [19]  459 	ld	a,-17 (ix)
   4212 DD 96 EB      [19]  460 	sub	a, -21 (ix)
   4215 DD 7E F0      [19]  461 	ld	a,-16 (ix)
   4218 DD 9E EC      [19]  462 	sbc	a, -20 (ix)
   421B E2 20 42      [10]  463 	jp	PO, 00275$
   421E EE 80         [ 7]  464 	xor	a, #0x80
   4220                     465 00275$:
   4220 FA 4D 42      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4223 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   4227 18 24         [12]  469 	jr	00146$
   4229                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   4229 DD 7E F1      [19]  472 	ld	a,-15 (ix)
   422C 3D            [ 4]  473 	dec	a
   422D 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   422F DD 7E ED      [19]  476 	ld	a,-19 (ix)
   4232 DD 96 EB      [19]  477 	sub	a, -21 (ix)
   4235 DD 7E EE      [19]  478 	ld	a,-18 (ix)
   4238 DD 9E EC      [19]  479 	sbc	a, -20 (ix)
   423B E2 40 42      [10]  480 	jp	PO, 00278$
   423E EE 80         [ 7]  481 	xor	a, #0x80
   4240                     482 00278$:
   4240 FA 4D 42      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4243 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   4247 18 04         [12]  486 	jr	00146$
   4249                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   4249 DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   424D                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 //&&
   424D DD 46 04      [19]  492 	ld	b,4 (ix)
   4250 04            [ 4]  493 	inc	b
   4251 DD 7E 05      [19]  494 	ld	a,5 (ix)
   4254 F5            [11]  495 	push	af
   4255 33            [ 6]  496 	inc	sp
   4256 C5            [11]  497 	push	bc
   4257 33            [ 6]  498 	inc	sp
   4258 DD 6E 08      [19]  499 	ld	l,8 (ix)
   425B DD 66 09      [19]  500 	ld	h,9 (ix)
   425E E5            [11]  501 	push	hl
   425F CD 1C 4A      [17]  502 	call	_getTilePtr
   4262 F1            [10]  503 	pop	af
   4263 F1            [10]  504 	pop	af
   4264 4E            [ 7]  505 	ld	c,(hl)
   4265 3E 02         [ 7]  506 	ld	a,#0x02
   4267 91            [ 4]  507 	sub	a, c
   4268 DA 38 43      [10]  508 	jp	C,00163$
                            509 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   426B DD 7E F4      [19]  510 	ld	a,-12 (ix)
   426E C6 01         [ 7]  511 	add	a, #0x01
   4270 DD 77 FC      [19]  512 	ld	-4 (ix),a
   4273 DD 7E F5      [19]  513 	ld	a,-11 (ix)
   4276 CE 00         [ 7]  514 	adc	a, #0x00
   4278 DD 77 FD      [19]  515 	ld	-3 (ix),a
   427B DD 7E F8      [19]  516 	ld	a,-8 (ix)
   427E DD 96 FC      [19]  517 	sub	a, -4 (ix)
   4281 DD 77 FC      [19]  518 	ld	-4 (ix),a
   4284 DD 7E F9      [19]  519 	ld	a,-7 (ix)
   4287 DD 9E FD      [19]  520 	sbc	a, -3 (ix)
   428A DD 77 FD      [19]  521 	ld	-3 (ix),a
   428D DD 6E FC      [19]  522 	ld	l,-4 (ix)
   4290 DD 66 FD      [19]  523 	ld	h,-3 (ix)
   4293 E5            [11]  524 	push	hl
   4294 CD 60 4A      [17]  525 	call	_abs
   4297 F1            [10]  526 	pop	af
   4298 DD 74 FD      [19]  527 	ld	-3 (ix),h
   429B DD 75 FC      [19]  528 	ld	-4 (ix),l
   429E DD 6E FA      [19]  529 	ld	l,-6 (ix)
   42A1 DD 66 FB      [19]  530 	ld	h,-5 (ix)
   42A4 E5            [11]  531 	push	hl
   42A5 CD 60 4A      [17]  532 	call	_abs
   42A8 F1            [10]  533 	pop	af
   42A9 DD 74 FB      [19]  534 	ld	-5 (ix),h
   42AC DD 75 FA      [19]  535 	ld	-6 (ix),l
   42AF DD 7E FC      [19]  536 	ld	a,-4 (ix)
   42B2 DD 86 FA      [19]  537 	add	a, -6 (ix)
   42B5 DD 77 FA      [19]  538 	ld	-6 (ix),a
   42B8 DD 7E FD      [19]  539 	ld	a,-3 (ix)
   42BB DD 8E FB      [19]  540 	adc	a, -5 (ix)
   42BE DD 77 FB      [19]  541 	ld	-5 (ix),a
   42C1 DD 7E FA      [19]  542 	ld	a,-6 (ix)
   42C4 DD 86 E7      [19]  543 	add	a, -25 (ix)
   42C7 DD 77 E9      [19]  544 	ld	-23 (ix),a
   42CA DD 7E FB      [19]  545 	ld	a,-5 (ix)
   42CD DD 8E E8      [19]  546 	adc	a, -24 (ix)
   42D0 DD 77 EA      [19]  547 	ld	-22 (ix),a
                            548 ;src/pathfinding.c:114: if(resultado == 0){
   42D3 DD 7E F1      [19]  549 	ld	a,-15 (ix)
   42D6 B7            [ 4]  550 	or	a, a
   42D7 20 1A         [12]  551 	jr	NZ,00160$
                            552 ;src/pathfinding.c:115: if(dist1 >= dist4)
   42D9 DD 7E EF      [19]  553 	ld	a,-17 (ix)
   42DC DD 96 E9      [19]  554 	sub	a, -23 (ix)
   42DF DD 7E F0      [19]  555 	ld	a,-16 (ix)
   42E2 DD 9E EA      [19]  556 	sbc	a, -22 (ix)
   42E5 E2 EA 42      [10]  557 	jp	PO, 00279$
   42E8 EE 80         [ 7]  558 	xor	a, #0x80
   42EA                     559 00279$:
   42EA FA 38 43      [10]  560 	jp	M,00163$
                            561 ;src/pathfinding.c:116: resultado = 3;
   42ED DD 36 F1 03   [19]  562 	ld	-15 (ix),#0x03
   42F1 18 45         [12]  563 	jr	00163$
   42F3                     564 00160$:
                            565 ;src/pathfinding.c:117: }else if(resultado == 1){
   42F3 DD 7E F1      [19]  566 	ld	a,-15 (ix)
   42F6 3D            [ 4]  567 	dec	a
   42F7 20 1A         [12]  568 	jr	NZ,00157$
                            569 ;src/pathfinding.c:118: if(dist2 >= dist4)
   42F9 DD 7E ED      [19]  570 	ld	a,-19 (ix)
   42FC DD 96 E9      [19]  571 	sub	a, -23 (ix)
   42FF DD 7E EE      [19]  572 	ld	a,-18 (ix)
   4302 DD 9E EA      [19]  573 	sbc	a, -22 (ix)
   4305 E2 0A 43      [10]  574 	jp	PO, 00282$
   4308 EE 80         [ 7]  575 	xor	a, #0x80
   430A                     576 00282$:
   430A FA 38 43      [10]  577 	jp	M,00163$
                            578 ;src/pathfinding.c:119: resultado = 3;
   430D DD 36 F1 03   [19]  579 	ld	-15 (ix),#0x03
   4311 18 25         [12]  580 	jr	00163$
   4313                     581 00157$:
                            582 ;src/pathfinding.c:120: }else if (resultado == 2){
   4313 DD 7E F1      [19]  583 	ld	a,-15 (ix)
   4316 D6 02         [ 7]  584 	sub	a, #0x02
   4318 20 1A         [12]  585 	jr	NZ,00154$
                            586 ;src/pathfinding.c:121: if(dist3 >= dist4)
   431A DD 7E EB      [19]  587 	ld	a,-21 (ix)
   431D DD 96 E9      [19]  588 	sub	a, -23 (ix)
   4320 DD 7E EC      [19]  589 	ld	a,-20 (ix)
   4323 DD 9E EA      [19]  590 	sbc	a, -22 (ix)
   4326 E2 2B 43      [10]  591 	jp	PO, 00285$
   4329 EE 80         [ 7]  592 	xor	a, #0x80
   432B                     593 00285$:
   432B FA 38 43      [10]  594 	jp	M,00163$
                            595 ;src/pathfinding.c:122: resultado = 3;
   432E DD 36 F1 03   [19]  596 	ld	-15 (ix),#0x03
   4332 18 04         [12]  597 	jr	00163$
   4334                     598 00154$:
                            599 ;src/pathfinding.c:124: resultado = 3;
   4334 DD 36 F1 03   [19]  600 	ld	-15 (ix),#0x03
   4338                     601 00163$:
                            602 ;src/pathfinding.c:128: return resultado;
   4338 DD 6E F1      [19]  603 	ld	l,-15 (ix)
   433B DD F9         [10]  604 	ld	sp, ix
   433D DD E1         [14]  605 	pop	ix
   433F C9            [10]  606 	ret
                            607 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            608 ;	---------------------------------
                            609 ; Function pathFinding
                            610 ; ---------------------------------
   4340                     611 _pathFinding::
   4340 DD E5         [15]  612 	push	ix
   4342 DD 21 00 00   [14]  613 	ld	ix,#0
   4346 DD 39         [15]  614 	add	ix,sp
   4348 21 F7 FF      [10]  615 	ld	hl,#-9
   434B 39            [11]  616 	add	hl,sp
   434C F9            [ 6]  617 	ld	sp,hl
                            618 ;src/pathfinding.c:144: u8 problem = 0;
   434D 1E 00         [ 7]  619 	ld	e,#0x00
                            620 ;src/pathfinding.c:146: x = s_x;
   434F DD 7E 04      [19]  621 	ld	a,4 (ix)
   4352 DD 77 FA      [19]  622 	ld	-6 (ix),a
                            623 ;src/pathfinding.c:147: sol_tam = 0;
   4355 21 FC 62      [10]  624 	ld	hl,#_sol_tam + 0
   4358 36 00         [10]  625 	ld	(hl), #0x00
                            626 ;src/pathfinding.c:148: y = s_y;
   435A DD 7E 05      [19]  627 	ld	a,5 (ix)
   435D DD 77 F9      [19]  628 	ld	-7 (ix),a
                            629 ;src/pathfinding.c:150: k = 0;
   4360 DD 36 F7 00   [19]  630 	ld	-9 (ix),#0x00
                            631 ;src/pathfinding.c:151: aux = 1;
   4364 DD 36 FB 01   [19]  632 	ld	-5 (ix),#0x01
                            633 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   4368 DD 7E 08      [19]  634 	ld	a,8 (ix)
   436B DD 77 FE      [19]  635 	ld	-2 (ix),a
   436E DD 7E 09      [19]  636 	ld	a,9 (ix)
   4371 DD 77 FF      [19]  637 	ld	-1 (ix),a
   4374 DD 7E FE      [19]  638 	ld	a,-2 (ix)
   4377 C6 E1         [ 7]  639 	add	a, #0xE1
   4379 4F            [ 4]  640 	ld	c,a
   437A DD 7E FF      [19]  641 	ld	a,-1 (ix)
   437D CE 00         [ 7]  642 	adc	a, #0x00
   437F 47            [ 4]  643 	ld	b,a
   4380 AF            [ 4]  644 	xor	a, a
   4381 02            [ 7]  645 	ld	(bc),a
                            646 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   4382 C5            [11]  647 	push	bc
   4383 D5            [11]  648 	push	de
   4384 DD 66 F9      [19]  649 	ld	h,-7 (ix)
   4387 DD 6E FA      [19]  650 	ld	l,-6 (ix)
   438A E5            [11]  651 	push	hl
   438B CD 0A 3F      [17]  652 	call	_anyadirALista
   438E F1            [10]  653 	pop	af
   438F D1            [10]  654 	pop	de
   4390 C1            [10]  655 	pop	bc
   4391 DD 75 F8      [19]  656 	ld	-8 (ix),l
                            657 ;src/pathfinding.c:157: while (aux){
   4394                     658 00114$:
   4394 DD 7E FB      [19]  659 	ld	a,-5 (ix)
   4397 B7            [ 4]  660 	or	a, a
   4398 CA 9B 44      [10]  661 	jp	Z,00116$
                            662 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   439B DD 7E 06      [19]  663 	ld	a,6 (ix)
   439E DD 96 FA      [19]  664 	sub	a, -6 (ix)
   43A1 20 08         [12]  665 	jr	NZ,00113$
   43A3 DD 7E 07      [19]  666 	ld	a,7 (ix)
   43A6 DD 96 F9      [19]  667 	sub	a, -7 (ix)
   43A9 28 06         [12]  668 	jr	Z,00109$
   43AB                     669 00113$:
   43AB DD 7E F8      [19]  670 	ld	a,-8 (ix)
   43AE B7            [ 4]  671 	or	a, a
   43AF 20 14         [12]  672 	jr	NZ,00110$
   43B1                     673 00109$:
                            674 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   43B1 DD 7E F8      [19]  675 	ld	a,-8 (ix)
   43B4 B7            [ 4]  676 	or	a, a
   43B5 28 06         [12]  677 	jr	Z,00101$
   43B7 3A FC 62      [13]  678 	ld	a,(#_sol_tam + 0)
   43BA B7            [ 4]  679 	or	a, a
   43BB 20 02         [12]  680 	jr	NZ,00102$
   43BD                     681 00101$:
                            682 ;src/pathfinding.c:161: problem = 1;
   43BD 1E 01         [ 7]  683 	ld	e,#0x01
   43BF                     684 00102$:
                            685 ;src/pathfinding.c:164: aux = 0;
   43BF DD 36 FB 00   [19]  686 	ld	-5 (ix),#0x00
   43C3 18 CF         [12]  687 	jr	00114$
   43C5                     688 00110$:
                            689 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   43C5 C5            [11]  690 	push	bc
   43C6 D5            [11]  691 	push	de
   43C7 DD 6E 0A      [19]  692 	ld	l,10 (ix)
   43CA DD 66 0B      [19]  693 	ld	h,11 (ix)
   43CD E5            [11]  694 	push	hl
   43CE DD 66 07      [19]  695 	ld	h,7 (ix)
   43D1 DD 6E 06      [19]  696 	ld	l,6 (ix)
   43D4 E5            [11]  697 	push	hl
   43D5 DD 66 F9      [19]  698 	ld	h,-7 (ix)
   43D8 DD 6E FA      [19]  699 	ld	l,-6 (ix)
   43DB E5            [11]  700 	push	hl
   43DC CD 52 3F      [17]  701 	call	_adjacentTiles
   43DF F1            [10]  702 	pop	af
   43E0 F1            [10]  703 	pop	af
   43E1 F1            [10]  704 	pop	af
   43E2 D1            [10]  705 	pop	de
   43E3 C1            [10]  706 	pop	bc
   43E4 55            [ 4]  707 	ld	d,l
                            708 ;src/pathfinding.c:168: switch(movimiento){
   43E5 3E 03         [ 7]  709 	ld	a,#0x03
   43E7 92            [ 4]  710 	sub	a, d
   43E8 38 AA         [12]  711 	jr	C,00114$
                            712 ;src/pathfinding.c:172: k = k+2;
   43EA DD 7E F7      [19]  713 	ld	a,-9 (ix)
   43ED C6 02         [ 7]  714 	add	a, #0x02
   43EF DD 77 FD      [19]  715 	ld	-3 (ix),a
                            716 ;src/pathfinding.c:168: switch(movimiento){
   43F2 D5            [11]  717 	push	de
   43F3 5A            [ 4]  718 	ld	e,d
   43F4 16 00         [ 7]  719 	ld	d,#0x00
   43F6 21 FD 43      [10]  720 	ld	hl,#00169$
   43F9 19            [11]  721 	add	hl,de
   43FA 19            [11]  722 	add	hl,de
                            723 ;src/pathfinding.c:169: case 0:
   43FB D1            [10]  724 	pop	de
   43FC E9            [ 4]  725 	jp	(hl)
   43FD                     726 00169$:
   43FD 18 06         [12]  727 	jr	00104$
   43FF 18 2D         [12]  728 	jr	00105$
   4401 18 4E         [12]  729 	jr	00106$
   4403 18 6E         [12]  730 	jr	00107$
   4405                     731 00104$:
                            732 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4405 DD 7E F9      [19]  733 	ld	a,-7 (ix)
   4408 C6 FE         [ 7]  734 	add	a,#0xFE
   440A DD 77 FC      [19]  735 	ld	-4 (ix),a
   440D C5            [11]  736 	push	bc
   440E D5            [11]  737 	push	de
   440F DD 66 FC      [19]  738 	ld	h,-4 (ix)
   4412 DD 6E FA      [19]  739 	ld	l,-6 (ix)
   4415 E5            [11]  740 	push	hl
   4416 CD 0A 3F      [17]  741 	call	_anyadirALista
   4419 F1            [10]  742 	pop	af
   441A D1            [10]  743 	pop	de
   441B C1            [10]  744 	pop	bc
   441C DD 75 F8      [19]  745 	ld	-8 (ix),l
                            746 ;src/pathfinding.c:171: y = y-2;
   441F DD 56 FC      [19]  747 	ld	d,-4 (ix)
   4422 DD 72 F9      [19]  748 	ld	-7 (ix),d
                            749 ;src/pathfinding.c:172: k = k+2;
   4425 DD 7E FD      [19]  750 	ld	a,-3 (ix)
   4428 DD 77 F7      [19]  751 	ld	-9 (ix),a
                            752 ;src/pathfinding.c:173: break;
   442B C3 94 43      [10]  753 	jp	00114$
                            754 ;src/pathfinding.c:174: case 1:
   442E                     755 00105$:
                            756 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   442E DD 56 F9      [19]  757 	ld	d,-7 (ix)
   4431 14            [ 4]  758 	inc	d
   4432 14            [ 4]  759 	inc	d
   4433 C5            [11]  760 	push	bc
   4434 D5            [11]  761 	push	de
   4435 D5            [11]  762 	push	de
   4436 33            [ 6]  763 	inc	sp
   4437 DD 7E FA      [19]  764 	ld	a,-6 (ix)
   443A F5            [11]  765 	push	af
   443B 33            [ 6]  766 	inc	sp
   443C CD 0A 3F      [17]  767 	call	_anyadirALista
   443F F1            [10]  768 	pop	af
   4440 D1            [10]  769 	pop	de
   4441 C1            [10]  770 	pop	bc
   4442 DD 75 F8      [19]  771 	ld	-8 (ix),l
                            772 ;src/pathfinding.c:178: y = y+2;
   4445 DD 72 F9      [19]  773 	ld	-7 (ix),d
                            774 ;src/pathfinding.c:179: k = k+2;
   4448 DD 7E FD      [19]  775 	ld	a,-3 (ix)
   444B DD 77 F7      [19]  776 	ld	-9 (ix),a
                            777 ;src/pathfinding.c:180: break;
   444E C3 94 43      [10]  778 	jp	00114$
                            779 ;src/pathfinding.c:181: case 2:
   4451                     780 00106$:
                            781 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4451 DD 56 FA      [19]  782 	ld	d,-6 (ix)
   4454 15            [ 4]  783 	dec	d
   4455 C5            [11]  784 	push	bc
   4456 D5            [11]  785 	push	de
   4457 DD 7E F9      [19]  786 	ld	a,-7 (ix)
   445A F5            [11]  787 	push	af
   445B 33            [ 6]  788 	inc	sp
   445C D5            [11]  789 	push	de
   445D 33            [ 6]  790 	inc	sp
   445E CD 0A 3F      [17]  791 	call	_anyadirALista
   4461 F1            [10]  792 	pop	af
   4462 D1            [10]  793 	pop	de
   4463 C1            [10]  794 	pop	bc
   4464 DD 75 F8      [19]  795 	ld	-8 (ix),l
                            796 ;src/pathfinding.c:185: x = x-1;
   4467 DD 72 FA      [19]  797 	ld	-6 (ix),d
                            798 ;src/pathfinding.c:186: k = k+2;
   446A DD 7E FD      [19]  799 	ld	a,-3 (ix)
   446D DD 77 F7      [19]  800 	ld	-9 (ix),a
                            801 ;src/pathfinding.c:187: break;
   4470 C3 94 43      [10]  802 	jp	00114$
                            803 ;src/pathfinding.c:188: case 3:
   4473                     804 00107$:
                            805 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4473 DD 7E FA      [19]  806 	ld	a,-6 (ix)
   4476 3C            [ 4]  807 	inc	a
   4477 DD 77 FC      [19]  808 	ld	-4 (ix),a
   447A C5            [11]  809 	push	bc
   447B D5            [11]  810 	push	de
   447C DD 66 F9      [19]  811 	ld	h,-7 (ix)
   447F DD 6E FC      [19]  812 	ld	l,-4 (ix)
   4482 E5            [11]  813 	push	hl
   4483 CD 0A 3F      [17]  814 	call	_anyadirALista
   4486 F1            [10]  815 	pop	af
   4487 D1            [10]  816 	pop	de
   4488 C1            [10]  817 	pop	bc
   4489 DD 75 F8      [19]  818 	ld	-8 (ix),l
                            819 ;src/pathfinding.c:190: x = x+1;
   448C DD 6E FC      [19]  820 	ld	l,-4 (ix)
   448F DD 75 FA      [19]  821 	ld	-6 (ix),l
                            822 ;src/pathfinding.c:191: k = k+2;
   4492 DD 7E FD      [19]  823 	ld	a,-3 (ix)
   4495 DD 77 F7      [19]  824 	ld	-9 (ix),a
                            825 ;src/pathfinding.c:194: }
   4498 C3 94 43      [10]  826 	jp	00114$
   449B                     827 00116$:
                            828 ;src/pathfinding.c:199: if(problem == 0){
   449B 7B            [ 4]  829 	ld	a,e
   449C B7            [ 4]  830 	or	a, a
   449D 20 44         [12]  831 	jr	NZ,00122$
                            832 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            833 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   449F 3A FC 62      [13]  834 	ld	a,(#_sol_tam + 0)
   44A2 FE C8         [ 7]  835 	cp	a,#0xC8
   44A4 30 03         [12]  836 	jr	NC,00118$
   44A6 02            [ 7]  837 	ld	(bc),a
   44A7 18 03         [12]  838 	jr	00137$
   44A9                     839 00118$:
                            840 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   44A9 3E C8         [ 7]  841 	ld	a,#0xC8
   44AB 02            [ 7]  842 	ld	(bc),a
                            843 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   44AC                     844 00137$:
   44AC DD 7E FE      [19]  845 	ld	a,-2 (ix)
   44AF C6 19         [ 7]  846 	add	a, #0x19
   44B1 DD 77 FE      [19]  847 	ld	-2 (ix),a
   44B4 DD 7E FF      [19]  848 	ld	a,-1 (ix)
   44B7 CE 00         [ 7]  849 	adc	a, #0x00
   44B9 DD 77 FF      [19]  850 	ld	-1 (ix),a
   44BC 1E 00         [ 7]  851 	ld	e,#0x00
   44BE                     852 00125$:
   44BE 0A            [ 7]  853 	ld	a,(bc)
   44BF 57            [ 4]  854 	ld	d,a
   44C0 7B            [ 4]  855 	ld	a,e
   44C1 92            [ 4]  856 	sub	a, d
   44C2 30 21         [12]  857 	jr	NC,00127$
                            858 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   44C4 E5            [11]  859 	push	hl
   44C5 6B            [ 4]  860 	ld	l,e
   44C6 26 00         [ 7]  861 	ld	h,#0x00
   44C8 E5            [11]  862 	push	hl
   44C9 FD E1         [14]  863 	pop	iy
   44CB E1            [10]  864 	pop	hl
   44CC C5            [11]  865 	push	bc
   44CD DD 4E FE      [19]  866 	ld	c,-2 (ix)
   44D0 DD 46 FF      [19]  867 	ld	b,-1 (ix)
   44D3 FD 09         [15]  868 	add	iy, bc
   44D5 C1            [10]  869 	pop	bc
   44D6 21 FD 62      [10]  870 	ld	hl,#_camino
   44D9 16 00         [ 7]  871 	ld	d,#0x00
   44DB 19            [11]  872 	add	hl, de
   44DC 56            [ 7]  873 	ld	d,(hl)
   44DD FD 72 00      [19]  874 	ld	0 (iy), d
                            875 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   44E0 1C            [ 4]  876 	inc	e
   44E1 18 DB         [12]  877 	jr	00125$
   44E3                     878 00122$:
                            879 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   44E3 AF            [ 4]  880 	xor	a, a
   44E4 02            [ 7]  881 	ld	(bc),a
   44E5                     882 00127$:
   44E5 DD F9         [10]  883 	ld	sp, ix
   44E7 DD E1         [14]  884 	pop	ix
   44E9 C9            [10]  885 	ret
                            886 	.area _CODE
                            887 	.area _INITIALIZER
                            888 	.area _CABS (ABS)
