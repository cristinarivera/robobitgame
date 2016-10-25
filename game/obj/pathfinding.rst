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
   5F5D                      26 _sol_tam::
   5F5D                      27 	.ds 1
   5F5E                      28 _camino::
   5F5E                      29 	.ds 200
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
   3F0C 3A 5D 5F      [13]   62 	ld	a,(#_sol_tam + 0)
   3F0F D6 C8         [ 7]   63 	sub	a, #0xC8
   3F11 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   3F13 01 5E 5F      [10]   66 	ld	bc,#_camino+0
   3F16 2A 5D 5F      [16]   67 	ld	hl,(_sol_tam)
   3F19 26 00         [ 7]   68 	ld	h,#0x00
   3F1B 09            [11]   69 	add	hl,bc
   3F1C FD 21 02 00   [14]   70 	ld	iy,#2
   3F20 FD 39         [15]   71 	add	iy,sp
   3F22 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3F25 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   3F26 21 5D 5F      [10]   75 	ld	hl, #_sol_tam+0
   3F29 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   3F2A 2A 5D 5F      [16]   78 	ld	hl,(_sol_tam)
   3F2D 26 00         [ 7]   79 	ld	h,#0x00
   3F2F 09            [11]   80 	add	hl,bc
   3F30 FD 21 03 00   [14]   81 	ld	iy,#3
   3F34 FD 39         [15]   82 	add	iy,sp
   3F36 FD 7E 00      [19]   83 	ld	a,0 (iy)
   3F39 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   3F3A 21 5D 5F      [10]   86 	ld	hl, #_sol_tam+0
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
   3F6B DD 36 E9 00   [19]  120 	ld	-23 (ix),#0x00
   3F6F DD 36 EA 00   [19]  121 	ld	-22 (ix),#0x00
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
   4050 CD 96 49      [17]  252 	call	_getTilePtr
   4053 F1            [10]  253 	pop	af
   4054 F1            [10]  254 	pop	af
   4055 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4056 DD 7E 06      [19]  257 	ld	a,6 (ix)
   4059 DD 77 FE      [19]  258 	ld	-2 (ix),a
   405C DD 36 FF 00   [19]  259 	ld	-1 (ix),#0x00
   4060 DD 7E 04      [19]  260 	ld	a,4 (ix)
   4063 DD 77 F4      [19]  261 	ld	-12 (ix),a
   4066 DD 36 F5 00   [19]  262 	ld	-11 (ix),#0x00
   406A DD 7E 07      [19]  263 	ld	a,7 (ix)
   406D DD 77 F6      [19]  264 	ld	-10 (ix),a
   4070 DD 36 F7 00   [19]  265 	ld	-9 (ix),#0x00
   4074 DD 7E 05      [19]  266 	ld	a,5 (ix)
   4077 DD 77 FA      [19]  267 	ld	-6 (ix),a
   407A DD 36 FB 00   [19]  268 	ld	-5 (ix),#0x00
   407E DD 7E FE      [19]  269 	ld	a,-2 (ix)
   4081 DD 96 F4      [19]  270 	sub	a, -12 (ix)
   4084 DD 77 FC      [19]  271 	ld	-4 (ix),a
   4087 DD 7E FF      [19]  272 	ld	a,-1 (ix)
   408A DD 9E F5      [19]  273 	sbc	a, -11 (ix)
   408D DD 77 FD      [19]  274 	ld	-3 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4090 3E 02         [ 7]  276 	ld	a,#0x02
   4092 91            [ 4]  277 	sub	a, c
   4093 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4095 DD 6E FC      [19]  280 	ld	l,-4 (ix)
   4098 DD 66 FD      [19]  281 	ld	h,-3 (ix)
   409B E5            [11]  282 	push	hl
   409C CD DA 49      [17]  283 	call	_abs
   409F F1            [10]  284 	pop	af
   40A0 DD 74 F3      [19]  285 	ld	-13 (ix),h
   40A3 DD 75 F2      [19]  286 	ld	-14 (ix),l
   40A6 DD 4E FA      [19]  287 	ld	c,-6 (ix)
   40A9 DD 46 FB      [19]  288 	ld	b,-5 (ix)
   40AC 0B            [ 6]  289 	dec	bc
   40AD 0B            [ 6]  290 	dec	bc
   40AE DD 7E F6      [19]  291 	ld	a,-10 (ix)
   40B1 91            [ 4]  292 	sub	a, c
   40B2 4F            [ 4]  293 	ld	c,a
   40B3 DD 7E F7      [19]  294 	ld	a,-9 (ix)
   40B6 98            [ 4]  295 	sbc	a, b
   40B7 47            [ 4]  296 	ld	b,a
   40B8 C5            [11]  297 	push	bc
   40B9 CD DA 49      [17]  298 	call	_abs
   40BC F1            [10]  299 	pop	af
   40BD DD 74 F9      [19]  300 	ld	-7 (ix),h
   40C0 DD 75 F8      [19]  301 	ld	-8 (ix),l
   40C3 DD 7E F2      [19]  302 	ld	a,-14 (ix)
   40C6 DD 86 F8      [19]  303 	add	a, -8 (ix)
   40C9 DD 77 F8      [19]  304 	ld	-8 (ix),a
   40CC DD 7E F3      [19]  305 	ld	a,-13 (ix)
   40CF DD 8E F9      [19]  306 	adc	a, -7 (ix)
   40D2 DD 77 F9      [19]  307 	ld	-7 (ix),a
   40D5 DD 7E F8      [19]  308 	ld	a,-8 (ix)
   40D8 DD 86 E3      [19]  309 	add	a, -29 (ix)
   40DB DD 77 F8      [19]  310 	ld	-8 (ix),a
   40DE DD 7E F9      [19]  311 	ld	a,-7 (ix)
   40E1 DD 8E E4      [19]  312 	adc	a, -28 (ix)
   40E4 DD 77 F9      [19]  313 	ld	-7 (ix),a
   40E7 DD 7E F8      [19]  314 	ld	a,-8 (ix)
   40EA DD 77 EF      [19]  315 	ld	-17 (ix),a
   40ED DD 7E F9      [19]  316 	ld	a,-7 (ix)
   40F0 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   40F3 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   40F7                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 /*&&
   40F7 DD 7E 05      [19]  322 	ld	a,5 (ix)
   40FA C6 16         [ 7]  323 	add	a, #0x16
   40FC 47            [ 4]  324 	ld	b,a
   40FD C5            [11]  325 	push	bc
   40FE 33            [ 6]  326 	inc	sp
   40FF DD 7E 04      [19]  327 	ld	a,4 (ix)
   4102 F5            [11]  328 	push	af
   4103 33            [ 6]  329 	inc	sp
   4104 DD 6E 08      [19]  330 	ld	l,8 (ix)
   4107 DD 66 09      [19]  331 	ld	h,9 (ix)
   410A E5            [11]  332 	push	hl
   410B CD 96 49      [17]  333 	call	_getTilePtr
   410E F1            [10]  334 	pop	af
   410F F1            [10]  335 	pop	af
   4110 4E            [ 7]  336 	ld	c,(hl)
   4111 3E 02         [ 7]  337 	ld	a,#0x02
   4113 91            [ 4]  338 	sub	a, c
   4114 DA AF 41      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4117 DD 6E FC      [19]  341 	ld	l,-4 (ix)
   411A DD 66 FD      [19]  342 	ld	h,-3 (ix)
   411D E5            [11]  343 	push	hl
   411E CD DA 49      [17]  344 	call	_abs
   4121 F1            [10]  345 	pop	af
   4122 DD 74 F9      [19]  346 	ld	-7 (ix),h
   4125 DD 75 F8      [19]  347 	ld	-8 (ix),l
   4128 DD 7E FA      [19]  348 	ld	a,-6 (ix)
   412B C6 02         [ 7]  349 	add	a, #0x02
   412D DD 77 F2      [19]  350 	ld	-14 (ix),a
   4130 DD 7E FB      [19]  351 	ld	a,-5 (ix)
   4133 CE 00         [ 7]  352 	adc	a, #0x00
   4135 DD 77 F3      [19]  353 	ld	-13 (ix),a
   4138 DD 7E F6      [19]  354 	ld	a,-10 (ix)
   413B DD 96 F2      [19]  355 	sub	a, -14 (ix)
   413E DD 77 F2      [19]  356 	ld	-14 (ix),a
   4141 DD 7E F7      [19]  357 	ld	a,-9 (ix)
   4144 DD 9E F3      [19]  358 	sbc	a, -13 (ix)
   4147 DD 77 F3      [19]  359 	ld	-13 (ix),a
   414A DD 6E F2      [19]  360 	ld	l,-14 (ix)
   414D DD 66 F3      [19]  361 	ld	h,-13 (ix)
   4150 E5            [11]  362 	push	hl
   4151 CD DA 49      [17]  363 	call	_abs
   4154 F1            [10]  364 	pop	af
   4155 DD 74 F3      [19]  365 	ld	-13 (ix),h
   4158 DD 75 F2      [19]  366 	ld	-14 (ix),l
   415B DD 7E F8      [19]  367 	ld	a,-8 (ix)
   415E DD 86 F2      [19]  368 	add	a, -14 (ix)
   4161 DD 77 F8      [19]  369 	ld	-8 (ix),a
   4164 DD 7E F9      [19]  370 	ld	a,-7 (ix)
   4167 DD 8E F3      [19]  371 	adc	a, -13 (ix)
   416A DD 77 F9      [19]  372 	ld	-7 (ix),a
   416D DD 7E E5      [19]  373 	ld	a,-27 (ix)
   4170 DD 86 F8      [19]  374 	add	a, -8 (ix)
   4173 DD 77 F8      [19]  375 	ld	-8 (ix),a
   4176 DD 7E E6      [19]  376 	ld	a,-26 (ix)
   4179 DD 8E F9      [19]  377 	adc	a, -7 (ix)
   417C DD 77 F9      [19]  378 	ld	-7 (ix),a
   417F DD 7E F8      [19]  379 	ld	a,-8 (ix)
   4182 DD 77 E9      [19]  380 	ld	-23 (ix),a
   4185 DD 7E F9      [19]  381 	ld	a,-7 (ix)
   4188 DD 77 EA      [19]  382 	ld	-22 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   418B DD 7E F1      [19]  384 	ld	a,-15 (ix)
   418E B7            [ 4]  385 	or	a, a
   418F 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   4191 DD 7E E9      [19]  388 	ld	a,-23 (ix)
   4194 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   4197 DD 7E EA      [19]  390 	ld	a,-22 (ix)
   419A DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   419D E2 A2 41      [10]  392 	jp	PO, 00274$
   41A0 EE 80         [ 7]  393 	xor	a, #0x80
   41A2                     394 00274$:
   41A2 F2 AF 41      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   41A5 DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   41A9 18 04         [12]  398 	jr	00134$
   41AB                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   41AB DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   41AF                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41AF DD 46 04      [19]  404 	ld	b,4 (ix)
   41B2 05            [ 4]  405 	dec	b
   41B3 DD 7E 05      [19]  406 	ld	a,5 (ix)
   41B6 F5            [11]  407 	push	af
   41B7 33            [ 6]  408 	inc	sp
   41B8 C5            [11]  409 	push	bc
   41B9 33            [ 6]  410 	inc	sp
   41BA DD 6E 08      [19]  411 	ld	l,8 (ix)
   41BD DD 66 09      [19]  412 	ld	h,9 (ix)
   41C0 E5            [11]  413 	push	hl
   41C1 CD 96 49      [17]  414 	call	_getTilePtr
   41C4 F1            [10]  415 	pop	af
   41C5 F1            [10]  416 	pop	af
   41C6 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41C7 DD 7E F6      [19]  419 	ld	a,-10 (ix)
   41CA DD 96 FA      [19]  420 	sub	a, -6 (ix)
   41CD DD 77 F8      [19]  421 	ld	-8 (ix),a
   41D0 DD 7E F7      [19]  422 	ld	a,-9 (ix)
   41D3 DD 9E FB      [19]  423 	sbc	a, -5 (ix)
   41D6 DD 77 F9      [19]  424 	ld	-7 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41D9 3E 02         [ 7]  426 	ld	a,#0x02
   41DB 91            [ 4]  427 	sub	a, c
   41DC 38 70         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41DE DD 4E F4      [19]  430 	ld	c,-12 (ix)
   41E1 DD 46 F5      [19]  431 	ld	b,-11 (ix)
   41E4 0B            [ 6]  432 	dec	bc
   41E5 DD 7E FE      [19]  433 	ld	a,-2 (ix)
   41E8 91            [ 4]  434 	sub	a, c
   41E9 4F            [ 4]  435 	ld	c,a
   41EA DD 7E FF      [19]  436 	ld	a,-1 (ix)
   41ED 98            [ 4]  437 	sbc	a, b
   41EE 47            [ 4]  438 	ld	b,a
   41EF C5            [11]  439 	push	bc
   41F0 CD DA 49      [17]  440 	call	_abs
   41F3 E3            [19]  441 	ex	(sp),hl
   41F4 DD 6E F8      [19]  442 	ld	l,-8 (ix)
   41F7 DD 66 F9      [19]  443 	ld	h,-7 (ix)
   41FA E5            [11]  444 	push	hl
   41FB CD DA 49      [17]  445 	call	_abs
   41FE F1            [10]  446 	pop	af
   41FF C1            [10]  447 	pop	bc
   4200 09            [11]  448 	add	hl,bc
   4201 D1            [10]  449 	pop	de
   4202 D5            [11]  450 	push	de
   4203 19            [11]  451 	add	hl,de
   4204 DD 75 EB      [19]  452 	ld	-21 (ix),l
   4207 DD 74 EC      [19]  453 	ld	-20 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   420A DD 7E F1      [19]  455 	ld	a,-15 (ix)
   420D B7            [ 4]  456 	or	a, a
   420E 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   4210 DD 7E EF      [19]  459 	ld	a,-17 (ix)
   4213 DD 96 EB      [19]  460 	sub	a, -21 (ix)
   4216 DD 7E F0      [19]  461 	ld	a,-16 (ix)
   4219 DD 9E EC      [19]  462 	sbc	a, -20 (ix)
   421C E2 21 42      [10]  463 	jp	PO, 00275$
   421F EE 80         [ 7]  464 	xor	a, #0x80
   4221                     465 00275$:
   4221 FA 4E 42      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4224 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   4228 18 24         [12]  469 	jr	00146$
   422A                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   422A DD 7E F1      [19]  472 	ld	a,-15 (ix)
   422D 3D            [ 4]  473 	dec	a
   422E 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   4230 DD 7E E9      [19]  476 	ld	a,-23 (ix)
   4233 DD 96 EB      [19]  477 	sub	a, -21 (ix)
   4236 DD 7E EA      [19]  478 	ld	a,-22 (ix)
   4239 DD 9E EC      [19]  479 	sbc	a, -20 (ix)
   423C E2 41 42      [10]  480 	jp	PO, 00278$
   423F EE 80         [ 7]  481 	xor	a, #0x80
   4241                     482 00278$:
   4241 FA 4E 42      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4244 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   4248 18 04         [12]  486 	jr	00146$
   424A                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   424A DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   424E                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 //&&
   424E DD 7E 04      [19]  492 	ld	a,4 (ix)
   4251 C6 05         [ 7]  493 	add	a, #0x05
   4253 47            [ 4]  494 	ld	b,a
   4254 DD 7E 05      [19]  495 	ld	a,5 (ix)
   4257 F5            [11]  496 	push	af
   4258 33            [ 6]  497 	inc	sp
   4259 C5            [11]  498 	push	bc
   425A 33            [ 6]  499 	inc	sp
   425B DD 6E 08      [19]  500 	ld	l,8 (ix)
   425E DD 66 09      [19]  501 	ld	h,9 (ix)
   4261 E5            [11]  502 	push	hl
   4262 CD 96 49      [17]  503 	call	_getTilePtr
   4265 F1            [10]  504 	pop	af
   4266 F1            [10]  505 	pop	af
   4267 4E            [ 7]  506 	ld	c,(hl)
   4268 3E 02         [ 7]  507 	ld	a,#0x02
   426A 91            [ 4]  508 	sub	a, c
   426B DA 3B 43      [10]  509 	jp	C,00163$
                            510 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   426E DD 7E F4      [19]  511 	ld	a,-12 (ix)
   4271 C6 01         [ 7]  512 	add	a, #0x01
   4273 DD 77 F2      [19]  513 	ld	-14 (ix),a
   4276 DD 7E F5      [19]  514 	ld	a,-11 (ix)
   4279 CE 00         [ 7]  515 	adc	a, #0x00
   427B DD 77 F3      [19]  516 	ld	-13 (ix),a
   427E DD 7E FE      [19]  517 	ld	a,-2 (ix)
   4281 DD 96 F2      [19]  518 	sub	a, -14 (ix)
   4284 DD 77 F2      [19]  519 	ld	-14 (ix),a
   4287 DD 7E FF      [19]  520 	ld	a,-1 (ix)
   428A DD 9E F3      [19]  521 	sbc	a, -13 (ix)
   428D DD 77 F3      [19]  522 	ld	-13 (ix),a
   4290 DD 6E F2      [19]  523 	ld	l,-14 (ix)
   4293 DD 66 F3      [19]  524 	ld	h,-13 (ix)
   4296 E5            [11]  525 	push	hl
   4297 CD DA 49      [17]  526 	call	_abs
   429A F1            [10]  527 	pop	af
   429B DD 74 F3      [19]  528 	ld	-13 (ix),h
   429E DD 75 F2      [19]  529 	ld	-14 (ix),l
   42A1 DD 6E F8      [19]  530 	ld	l,-8 (ix)
   42A4 DD 66 F9      [19]  531 	ld	h,-7 (ix)
   42A7 E5            [11]  532 	push	hl
   42A8 CD DA 49      [17]  533 	call	_abs
   42AB F1            [10]  534 	pop	af
   42AC DD 74 F9      [19]  535 	ld	-7 (ix),h
   42AF DD 75 F8      [19]  536 	ld	-8 (ix),l
   42B2 DD 7E F2      [19]  537 	ld	a,-14 (ix)
   42B5 DD 86 F8      [19]  538 	add	a, -8 (ix)
   42B8 DD 77 F8      [19]  539 	ld	-8 (ix),a
   42BB DD 7E F3      [19]  540 	ld	a,-13 (ix)
   42BE DD 8E F9      [19]  541 	adc	a, -7 (ix)
   42C1 DD 77 F9      [19]  542 	ld	-7 (ix),a
   42C4 DD 7E F8      [19]  543 	ld	a,-8 (ix)
   42C7 DD 86 E7      [19]  544 	add	a, -25 (ix)
   42CA DD 77 ED      [19]  545 	ld	-19 (ix),a
   42CD DD 7E F9      [19]  546 	ld	a,-7 (ix)
   42D0 DD 8E E8      [19]  547 	adc	a, -24 (ix)
   42D3 DD 77 EE      [19]  548 	ld	-18 (ix),a
                            549 ;src/pathfinding.c:114: if(resultado == 0){
   42D6 DD 7E F1      [19]  550 	ld	a,-15 (ix)
   42D9 B7            [ 4]  551 	or	a, a
   42DA 20 1A         [12]  552 	jr	NZ,00160$
                            553 ;src/pathfinding.c:115: if(dist1 >= dist4)
   42DC DD 7E EF      [19]  554 	ld	a,-17 (ix)
   42DF DD 96 ED      [19]  555 	sub	a, -19 (ix)
   42E2 DD 7E F0      [19]  556 	ld	a,-16 (ix)
   42E5 DD 9E EE      [19]  557 	sbc	a, -18 (ix)
   42E8 E2 ED 42      [10]  558 	jp	PO, 00279$
   42EB EE 80         [ 7]  559 	xor	a, #0x80
   42ED                     560 00279$:
   42ED FA 3B 43      [10]  561 	jp	M,00163$
                            562 ;src/pathfinding.c:116: resultado = 3;
   42F0 DD 36 F1 03   [19]  563 	ld	-15 (ix),#0x03
   42F4 18 45         [12]  564 	jr	00163$
   42F6                     565 00160$:
                            566 ;src/pathfinding.c:117: }else if(resultado == 1){
   42F6 DD 7E F1      [19]  567 	ld	a,-15 (ix)
   42F9 3D            [ 4]  568 	dec	a
   42FA 20 1A         [12]  569 	jr	NZ,00157$
                            570 ;src/pathfinding.c:118: if(dist2 >= dist4)
   42FC DD 7E E9      [19]  571 	ld	a,-23 (ix)
   42FF DD 96 ED      [19]  572 	sub	a, -19 (ix)
   4302 DD 7E EA      [19]  573 	ld	a,-22 (ix)
   4305 DD 9E EE      [19]  574 	sbc	a, -18 (ix)
   4308 E2 0D 43      [10]  575 	jp	PO, 00282$
   430B EE 80         [ 7]  576 	xor	a, #0x80
   430D                     577 00282$:
   430D FA 3B 43      [10]  578 	jp	M,00163$
                            579 ;src/pathfinding.c:119: resultado = 3;
   4310 DD 36 F1 03   [19]  580 	ld	-15 (ix),#0x03
   4314 18 25         [12]  581 	jr	00163$
   4316                     582 00157$:
                            583 ;src/pathfinding.c:120: }else if (resultado == 2){
   4316 DD 7E F1      [19]  584 	ld	a,-15 (ix)
   4319 D6 02         [ 7]  585 	sub	a, #0x02
   431B 20 1A         [12]  586 	jr	NZ,00154$
                            587 ;src/pathfinding.c:121: if(dist3 >= dist4)
   431D DD 7E EB      [19]  588 	ld	a,-21 (ix)
   4320 DD 96 ED      [19]  589 	sub	a, -19 (ix)
   4323 DD 7E EC      [19]  590 	ld	a,-20 (ix)
   4326 DD 9E EE      [19]  591 	sbc	a, -18 (ix)
   4329 E2 2E 43      [10]  592 	jp	PO, 00285$
   432C EE 80         [ 7]  593 	xor	a, #0x80
   432E                     594 00285$:
   432E FA 3B 43      [10]  595 	jp	M,00163$
                            596 ;src/pathfinding.c:122: resultado = 3;
   4331 DD 36 F1 03   [19]  597 	ld	-15 (ix),#0x03
   4335 18 04         [12]  598 	jr	00163$
   4337                     599 00154$:
                            600 ;src/pathfinding.c:124: resultado = 3;
   4337 DD 36 F1 03   [19]  601 	ld	-15 (ix),#0x03
   433B                     602 00163$:
                            603 ;src/pathfinding.c:128: return resultado;
   433B DD 6E F1      [19]  604 	ld	l,-15 (ix)
   433E DD F9         [10]  605 	ld	sp, ix
   4340 DD E1         [14]  606 	pop	ix
   4342 C9            [10]  607 	ret
                            608 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                            609 ;	---------------------------------
                            610 ; Function pathFinding
                            611 ; ---------------------------------
   4343                     612 _pathFinding::
   4343 DD E5         [15]  613 	push	ix
   4345 DD 21 00 00   [14]  614 	ld	ix,#0
   4349 DD 39         [15]  615 	add	ix,sp
   434B 21 F7 FF      [10]  616 	ld	hl,#-9
   434E 39            [11]  617 	add	hl,sp
   434F F9            [ 6]  618 	ld	sp,hl
                            619 ;src/pathfinding.c:144: u8 problem = 0;
   4350 1E 00         [ 7]  620 	ld	e,#0x00
                            621 ;src/pathfinding.c:146: x = s_x;
   4352 DD 7E 04      [19]  622 	ld	a,4 (ix)
   4355 DD 77 F8      [19]  623 	ld	-8 (ix),a
                            624 ;src/pathfinding.c:148: y = s_y;
   4358 DD 7E 05      [19]  625 	ld	a,5 (ix)
   435B DD 77 FB      [19]  626 	ld	-5 (ix),a
                            627 ;src/pathfinding.c:150: k = 0;
   435E DD 36 F9 00   [19]  628 	ld	-7 (ix),#0x00
                            629 ;src/pathfinding.c:151: aux = 1;
   4362 DD 36 FA 01   [19]  630 	ld	-6 (ix),#0x01
                            631 ;src/pathfinding.c:155: enemy->longitud_camino = 0;
   4366 DD 7E 08      [19]  632 	ld	a,8 (ix)
   4369 DD 77 FC      [19]  633 	ld	-4 (ix),a
   436C DD 7E 09      [19]  634 	ld	a,9 (ix)
   436F DD 77 FD      [19]  635 	ld	-3 (ix),a
   4372 DD 7E FC      [19]  636 	ld	a,-4 (ix)
   4375 C6 1B         [ 7]  637 	add	a, #0x1B
   4377 4F            [ 4]  638 	ld	c,a
   4378 DD 7E FD      [19]  639 	ld	a,-3 (ix)
   437B CE 00         [ 7]  640 	adc	a, #0x00
   437D 47            [ 4]  641 	ld	b,a
   437E AF            [ 4]  642 	xor	a, a
   437F 02            [ 7]  643 	ld	(bc),a
                            644 ;src/pathfinding.c:156: sol_tam = 0;
   4380 21 5D 5F      [10]  645 	ld	hl,#_sol_tam + 0
   4383 36 00         [10]  646 	ld	(hl), #0x00
                            647 ;src/pathfinding.c:158: inserted = anyadirALista(x, y);
   4385 C5            [11]  648 	push	bc
   4386 D5            [11]  649 	push	de
   4387 DD 66 FB      [19]  650 	ld	h,-5 (ix)
   438A DD 6E F8      [19]  651 	ld	l,-8 (ix)
   438D E5            [11]  652 	push	hl
   438E CD 0A 3F      [17]  653 	call	_anyadirALista
   4391 F1            [10]  654 	pop	af
   4392 D1            [10]  655 	pop	de
   4393 C1            [10]  656 	pop	bc
   4394 DD 75 F7      [19]  657 	ld	-9 (ix),l
                            658 ;src/pathfinding.c:162: while (aux){
   4397                     659 00115$:
   4397 DD 7E FA      [19]  660 	ld	a,-6 (ix)
   439A B7            [ 4]  661 	or	a, a
   439B CA A4 44      [10]  662 	jp	Z,00117$
                            663 ;src/pathfinding.c:163: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   439E DD 7E 06      [19]  664 	ld	a,6 (ix)
   43A1 DD 96 F8      [19]  665 	sub	a, -8 (ix)
   43A4 20 08         [12]  666 	jr	NZ,00113$
   43A6 DD 7E 07      [19]  667 	ld	a,7 (ix)
   43A9 DD 96 FB      [19]  668 	sub	a, -5 (ix)
   43AC 28 0C         [12]  669 	jr	Z,00109$
   43AE                     670 00113$:
   43AE 3A 5D 5F      [13]  671 	ld	a,(#_sol_tam + 0)
   43B1 B7            [ 4]  672 	or	a, a
   43B2 28 06         [12]  673 	jr	Z,00109$
   43B4 DD 7E F7      [19]  674 	ld	a,-9 (ix)
   43B7 B7            [ 4]  675 	or	a, a
   43B8 20 14         [12]  676 	jr	NZ,00110$
   43BA                     677 00109$:
                            678 ;src/pathfinding.c:165: if(inserted == 0 || sol_tam == 0){
   43BA DD 7E F7      [19]  679 	ld	a,-9 (ix)
   43BD B7            [ 4]  680 	or	a, a
   43BE 28 06         [12]  681 	jr	Z,00101$
   43C0 3A 5D 5F      [13]  682 	ld	a,(#_sol_tam + 0)
   43C3 B7            [ 4]  683 	or	a, a
   43C4 20 02         [12]  684 	jr	NZ,00102$
   43C6                     685 00101$:
                            686 ;src/pathfinding.c:166: problem = 1;
   43C6 1E 01         [ 7]  687 	ld	e,#0x01
   43C8                     688 00102$:
                            689 ;src/pathfinding.c:169: aux = 0;
   43C8 DD 36 FA 00   [19]  690 	ld	-6 (ix),#0x00
   43CC 18 C9         [12]  691 	jr	00115$
   43CE                     692 00110$:
                            693 ;src/pathfinding.c:171: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   43CE C5            [11]  694 	push	bc
   43CF D5            [11]  695 	push	de
   43D0 DD 6E 0A      [19]  696 	ld	l,10 (ix)
   43D3 DD 66 0B      [19]  697 	ld	h,11 (ix)
   43D6 E5            [11]  698 	push	hl
   43D7 DD 66 07      [19]  699 	ld	h,7 (ix)
   43DA DD 6E 06      [19]  700 	ld	l,6 (ix)
   43DD E5            [11]  701 	push	hl
   43DE DD 66 FB      [19]  702 	ld	h,-5 (ix)
   43E1 DD 6E F8      [19]  703 	ld	l,-8 (ix)
   43E4 E5            [11]  704 	push	hl
   43E5 CD 52 3F      [17]  705 	call	_adjacentTiles
   43E8 F1            [10]  706 	pop	af
   43E9 F1            [10]  707 	pop	af
   43EA F1            [10]  708 	pop	af
   43EB D1            [10]  709 	pop	de
   43EC C1            [10]  710 	pop	bc
   43ED 55            [ 4]  711 	ld	d,l
                            712 ;src/pathfinding.c:173: switch(movimiento){
   43EE 3E 03         [ 7]  713 	ld	a,#0x03
   43F0 92            [ 4]  714 	sub	a, d
   43F1 38 A4         [12]  715 	jr	C,00115$
                            716 ;src/pathfinding.c:177: k = k+2;
   43F3 DD 7E F9      [19]  717 	ld	a,-7 (ix)
   43F6 C6 02         [ 7]  718 	add	a, #0x02
   43F8 DD 77 FF      [19]  719 	ld	-1 (ix),a
                            720 ;src/pathfinding.c:173: switch(movimiento){
   43FB D5            [11]  721 	push	de
   43FC 5A            [ 4]  722 	ld	e,d
   43FD 16 00         [ 7]  723 	ld	d,#0x00
   43FF 21 06 44      [10]  724 	ld	hl,#00161$
   4402 19            [11]  725 	add	hl,de
   4403 19            [11]  726 	add	hl,de
                            727 ;src/pathfinding.c:174: case 0:
   4404 D1            [10]  728 	pop	de
   4405 E9            [ 4]  729 	jp	(hl)
   4406                     730 00161$:
   4406 18 06         [12]  731 	jr	00104$
   4408 18 2D         [12]  732 	jr	00105$
   440A 18 4E         [12]  733 	jr	00106$
   440C 18 6E         [12]  734 	jr	00107$
   440E                     735 00104$:
                            736 ;src/pathfinding.c:175: inserted = anyadirALista(x, y-2);
   440E DD 7E FB      [19]  737 	ld	a,-5 (ix)
   4411 C6 FE         [ 7]  738 	add	a,#0xFE
   4413 DD 77 FE      [19]  739 	ld	-2 (ix),a
   4416 C5            [11]  740 	push	bc
   4417 D5            [11]  741 	push	de
   4418 DD 66 FE      [19]  742 	ld	h,-2 (ix)
   441B DD 6E F8      [19]  743 	ld	l,-8 (ix)
   441E E5            [11]  744 	push	hl
   441F CD 0A 3F      [17]  745 	call	_anyadirALista
   4422 F1            [10]  746 	pop	af
   4423 D1            [10]  747 	pop	de
   4424 C1            [10]  748 	pop	bc
   4425 DD 75 F7      [19]  749 	ld	-9 (ix),l
                            750 ;src/pathfinding.c:176: y = y-2;
   4428 DD 56 FE      [19]  751 	ld	d,-2 (ix)
   442B DD 72 FB      [19]  752 	ld	-5 (ix),d
                            753 ;src/pathfinding.c:177: k = k+2;
   442E DD 7E FF      [19]  754 	ld	a,-1 (ix)
   4431 DD 77 F9      [19]  755 	ld	-7 (ix),a
                            756 ;src/pathfinding.c:178: break;
   4434 C3 97 43      [10]  757 	jp	00115$
                            758 ;src/pathfinding.c:179: case 1:
   4437                     759 00105$:
                            760 ;src/pathfinding.c:182: inserted = anyadirALista(x, y+2);
   4437 DD 56 FB      [19]  761 	ld	d,-5 (ix)
   443A 14            [ 4]  762 	inc	d
   443B 14            [ 4]  763 	inc	d
   443C C5            [11]  764 	push	bc
   443D D5            [11]  765 	push	de
   443E D5            [11]  766 	push	de
   443F 33            [ 6]  767 	inc	sp
   4440 DD 7E F8      [19]  768 	ld	a,-8 (ix)
   4443 F5            [11]  769 	push	af
   4444 33            [ 6]  770 	inc	sp
   4445 CD 0A 3F      [17]  771 	call	_anyadirALista
   4448 F1            [10]  772 	pop	af
   4449 D1            [10]  773 	pop	de
   444A C1            [10]  774 	pop	bc
   444B DD 75 F7      [19]  775 	ld	-9 (ix),l
                            776 ;src/pathfinding.c:183: y = y+2;
   444E DD 72 FB      [19]  777 	ld	-5 (ix),d
                            778 ;src/pathfinding.c:184: k = k+2;
   4451 DD 7E FF      [19]  779 	ld	a,-1 (ix)
   4454 DD 77 F9      [19]  780 	ld	-7 (ix),a
                            781 ;src/pathfinding.c:185: break;
   4457 C3 97 43      [10]  782 	jp	00115$
                            783 ;src/pathfinding.c:186: case 2:
   445A                     784 00106$:
                            785 ;src/pathfinding.c:189: inserted = anyadirALista(x-1, y);
   445A DD 56 F8      [19]  786 	ld	d,-8 (ix)
   445D 15            [ 4]  787 	dec	d
   445E C5            [11]  788 	push	bc
   445F D5            [11]  789 	push	de
   4460 DD 7E FB      [19]  790 	ld	a,-5 (ix)
   4463 F5            [11]  791 	push	af
   4464 33            [ 6]  792 	inc	sp
   4465 D5            [11]  793 	push	de
   4466 33            [ 6]  794 	inc	sp
   4467 CD 0A 3F      [17]  795 	call	_anyadirALista
   446A F1            [10]  796 	pop	af
   446B D1            [10]  797 	pop	de
   446C C1            [10]  798 	pop	bc
   446D DD 75 F7      [19]  799 	ld	-9 (ix),l
                            800 ;src/pathfinding.c:190: x = x-1;
   4470 DD 72 F8      [19]  801 	ld	-8 (ix),d
                            802 ;src/pathfinding.c:191: k = k+2;
   4473 DD 7E FF      [19]  803 	ld	a,-1 (ix)
   4476 DD 77 F9      [19]  804 	ld	-7 (ix),a
                            805 ;src/pathfinding.c:192: break;
   4479 C3 97 43      [10]  806 	jp	00115$
                            807 ;src/pathfinding.c:193: case 3:
   447C                     808 00107$:
                            809 ;src/pathfinding.c:194: inserted = anyadirALista(x+1, y);
   447C DD 7E F8      [19]  810 	ld	a,-8 (ix)
   447F 3C            [ 4]  811 	inc	a
   4480 DD 77 FE      [19]  812 	ld	-2 (ix),a
   4483 C5            [11]  813 	push	bc
   4484 D5            [11]  814 	push	de
   4485 DD 66 FB      [19]  815 	ld	h,-5 (ix)
   4488 DD 6E FE      [19]  816 	ld	l,-2 (ix)
   448B E5            [11]  817 	push	hl
   448C CD 0A 3F      [17]  818 	call	_anyadirALista
   448F F1            [10]  819 	pop	af
   4490 D1            [10]  820 	pop	de
   4491 C1            [10]  821 	pop	bc
   4492 DD 75 F7      [19]  822 	ld	-9 (ix),l
                            823 ;src/pathfinding.c:195: x = x+1;
   4495 DD 6E FE      [19]  824 	ld	l,-2 (ix)
   4498 DD 75 F8      [19]  825 	ld	-8 (ix),l
                            826 ;src/pathfinding.c:196: k = k+2;
   449B DD 7E FF      [19]  827 	ld	a,-1 (ix)
   449E DD 77 F9      [19]  828 	ld	-7 (ix),a
                            829 ;src/pathfinding.c:199: }
   44A1 C3 97 43      [10]  830 	jp	00115$
   44A4                     831 00117$:
                            832 ;src/pathfinding.c:204: if(problem == 0){
   44A4 7B            [ 4]  833 	ld	a,e
   44A5 B7            [ 4]  834 	or	a, a
   44A6 20 22         [12]  835 	jr	NZ,00122$
                            836 ;src/pathfinding.c:205: if(sol_tam < CAMINO_TAM){
                            837 ;src/pathfinding.c:206: enemy->longitud_camino = sol_tam;
   44A8 3A 5D 5F      [13]  838 	ld	a,(#_sol_tam + 0)
   44AB FE C8         [ 7]  839 	cp	a,#0xC8
   44AD 30 03         [12]  840 	jr	NC,00119$
   44AF 02            [ 7]  841 	ld	(bc),a
   44B0 18 03         [12]  842 	jr	00120$
   44B2                     843 00119$:
                            844 ;src/pathfinding.c:208: enemy->longitud_camino = CAMINO_TAM;
   44B2 3E C8         [ 7]  845 	ld	a,#0xC8
   44B4 02            [ 7]  846 	ld	(bc),a
   44B5                     847 00120$:
                            848 ;src/pathfinding.c:210: enemy->camino = camino;
   44B5 DD 7E FC      [19]  849 	ld	a,-4 (ix)
   44B8 C6 19         [ 7]  850 	add	a, #0x19
   44BA 4F            [ 4]  851 	ld	c,a
   44BB DD 7E FD      [19]  852 	ld	a,-3 (ix)
   44BE CE 00         [ 7]  853 	adc	a, #0x00
   44C0 47            [ 4]  854 	ld	b,a
   44C1 3E 5E         [ 7]  855 	ld	a,#<(_camino)
   44C3 02            [ 7]  856 	ld	(bc),a
   44C4 03            [ 6]  857 	inc	bc
   44C5 3E 5F         [ 7]  858 	ld	a,#>(_camino)
   44C7 02            [ 7]  859 	ld	(bc),a
   44C8 18 02         [12]  860 	jr	00124$
   44CA                     861 00122$:
                            862 ;src/pathfinding.c:213: enemy->longitud_camino = 0;
   44CA AF            [ 4]  863 	xor	a, a
   44CB 02            [ 7]  864 	ld	(bc),a
   44CC                     865 00124$:
   44CC DD F9         [10]  866 	ld	sp, ix
   44CE DD E1         [14]  867 	pop	ix
   44D0 C9            [10]  868 	ret
                            869 	.area _CODE
                            870 	.area _INITIALIZER
                            871 	.area _CABS (ABS)
