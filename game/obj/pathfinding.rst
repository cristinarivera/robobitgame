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
   63FC                      26 _sol_tam::
   63FC                      27 	.ds 1
   63FD                      28 _camino::
   63FD                      29 	.ds 200
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
   3F0C 3A FC 63      [13]   62 	ld	a,(#_sol_tam + 0)
   3F0F D6 C8         [ 7]   63 	sub	a, #0xC8
   3F11 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   3F13 01 FD 63      [10]   66 	ld	bc,#_camino+0
   3F16 2A FC 63      [16]   67 	ld	hl,(_sol_tam)
   3F19 26 00         [ 7]   68 	ld	h,#0x00
   3F1B 09            [11]   69 	add	hl,bc
   3F1C FD 21 02 00   [14]   70 	ld	iy,#2
   3F20 FD 39         [15]   71 	add	iy,sp
   3F22 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3F25 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   3F26 21 FC 63      [10]   75 	ld	hl, #_sol_tam+0
   3F29 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   3F2A 2A FC 63      [16]   78 	ld	hl,(_sol_tam)
   3F2D 26 00         [ 7]   79 	ld	h,#0x00
   3F2F 09            [11]   80 	add	hl,bc
   3F30 FD 21 03 00   [14]   81 	ld	iy,#3
   3F34 FD 39         [15]   82 	add	iy,sp
   3F36 FD 7E 00      [19]   83 	ld	a,0 (iy)
   3F39 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   3F3A 21 FC 63      [10]   86 	ld	hl, #_sol_tam+0
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
   3F7B DD 36 E5 00   [19]  126 	ld	-27 (ix),#0x00
   3F7F DD 36 E6 00   [19]  127 	ld	-26 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   3F83 21 00 00      [10]  129 	ld	hl,#0x0000
   3F86 E3            [19]  130 	ex	(sp), hl
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   3F87 DD 36 E1 00   [19]  132 	ld	-31 (ix),#0x00
   3F8B DD 36 E2 00   [19]  133 	ld	-30 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   3F8F DD 36 E3 00   [19]  135 	ld	-29 (ix),#0x00
   3F93 DD 36 E4 00   [19]  136 	ld	-28 (ix),#0x00
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
   3FAD DD 36 E3 FF   [19]  152 	ld	-29 (ix),#0xFF
   3FB1 DD 36 E4 FF   [19]  153 	ld	-28 (ix),#0xFF
   3FB5                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   3FB5 DD 7E 07      [19]  156 	ld	a,7 (ix)
   3FB8 DD 96 05      [19]  157 	sub	a, 5 (ix)
   3FBB D2 3D 40      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   3FBE DD 36 E1 FF   [19]  160 	ld	-31 (ix),#0xFF
   3FC2 DD 36 E2 FF   [19]  161 	ld	-30 (ix),#0xFF
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
   3FE9 DD 36 E5 FF   [19]  185 	ld	-27 (ix),#0xFF
   3FED DD 36 E6 FF   [19]  186 	ld	-26 (ix),#0xFF
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
   4003 DD 36 E3 FF   [19]  206 	ld	-29 (ix),#0xFF
   4007 DD 36 E4 FF   [19]  207 	ld	-28 (ix),#0xFF
   400B 18 08         [12]  208 	jr	00111$
   400D                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   400D DD 36 E1 FF   [19]  211 	ld	-31 (ix),#0xFF
   4011 DD 36 E2 FF   [19]  212 	ld	-30 (ix),#0xFF
   4015                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4015 DD 36 E5 FF   [19]  215 	ld	-27 (ix),#0xFF
   4019 DD 36 E6 FF   [19]  216 	ld	-26 (ix),#0xFF
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
   4027 DD 36 E3 FF   [19]  228 	ld	-29 (ix),#0xFF
   402B DD 36 E4 FF   [19]  229 	ld	-28 (ix),#0xFF
   402F 18 08         [12]  230 	jr	00114$
   4031                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4031 DD 36 E1 FF   [19]  233 	ld	-31 (ix),#0xFF
   4035 DD 36 E2 FF   [19]  234 	ld	-30 (ix),#0xFF
   4039                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4039 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   403C E3            [19]  238 	ex	(sp), hl
   403D                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   403D DD 7E 05      [19]  241 	ld	a,5 (ix)
   4040 C6 FE         [ 7]  242 	add	a,#0xFE
   4042 DD 77 F9      [19]  243 	ld	-7 (ix), a
   4045 F5            [11]  244 	push	af
   4046 33            [ 6]  245 	inc	sp
   4047 DD 7E 04      [19]  246 	ld	a,4 (ix)
   404A F5            [11]  247 	push	af
   404B 33            [ 6]  248 	inc	sp
   404C DD 6E 08      [19]  249 	ld	l,8 (ix)
   404F DD 66 09      [19]  250 	ld	h,9 (ix)
   4052 E5            [11]  251 	push	hl
   4053 CD 1C 4B      [17]  252 	call	_getTilePtr
   4056 F1            [10]  253 	pop	af
   4057 F1            [10]  254 	pop	af
   4058 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   4059 DD 7E 04      [19]  257 	ld	a,4 (ix)
   405C C6 04         [ 7]  258 	add	a, #0x04
   405E DD 77 F0      [19]  259 	ld	-16 (ix),a
                            260 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4061 DD 7E 06      [19]  261 	ld	a,6 (ix)
   4064 DD 77 FC      [19]  262 	ld	-4 (ix),a
   4067 DD 36 FD 00   [19]  263 	ld	-3 (ix),#0x00
   406B DD 7E 04      [19]  264 	ld	a,4 (ix)
   406E DD 77 FE      [19]  265 	ld	-2 (ix),a
   4071 DD 36 FF 00   [19]  266 	ld	-1 (ix),#0x00
   4075 DD 7E 07      [19]  267 	ld	a,7 (ix)
   4078 DD 77 F3      [19]  268 	ld	-13 (ix),a
   407B DD 36 F4 00   [19]  269 	ld	-12 (ix),#0x00
   407F DD 7E 05      [19]  270 	ld	a,5 (ix)
   4082 DD 77 F5      [19]  271 	ld	-11 (ix),a
   4085 DD 36 F6 00   [19]  272 	ld	-10 (ix),#0x00
   4089 DD 7E FC      [19]  273 	ld	a,-4 (ix)
   408C DD 96 FE      [19]  274 	sub	a, -2 (ix)
   408F DD 77 F7      [19]  275 	ld	-9 (ix),a
   4092 DD 7E FD      [19]  276 	ld	a,-3 (ix)
   4095 DD 9E FF      [19]  277 	sbc	a, -1 (ix)
   4098 DD 77 F8      [19]  278 	ld	-8 (ix),a
                            279 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   409B 3E 02         [ 7]  280 	ld	a,#0x02
   409D 91            [ 4]  281 	sub	a, c
   409E DA 32 41      [10]  282 	jp	C,00127$
                            283 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   40A1 DD 66 F9      [19]  284 	ld	h,-7 (ix)
   40A4 DD 6E F0      [19]  285 	ld	l,-16 (ix)
   40A7 E5            [11]  286 	push	hl
   40A8 DD 6E 08      [19]  287 	ld	l,8 (ix)
   40AB DD 66 09      [19]  288 	ld	h,9 (ix)
   40AE E5            [11]  289 	push	hl
   40AF CD 1C 4B      [17]  290 	call	_getTilePtr
   40B2 F1            [10]  291 	pop	af
   40B3 F1            [10]  292 	pop	af
   40B4 4E            [ 7]  293 	ld	c,(hl)
   40B5 3E 02         [ 7]  294 	ld	a,#0x02
   40B7 91            [ 4]  295 	sub	a, c
   40B8 38 78         [12]  296 	jr	C,00127$
                            297 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   40BA DD 6E F7      [19]  298 	ld	l,-9 (ix)
   40BD DD 66 F8      [19]  299 	ld	h,-8 (ix)
   40C0 E5            [11]  300 	push	hl
   40C1 CD 60 4B      [17]  301 	call	_abs
   40C4 F1            [10]  302 	pop	af
   40C5 DD 74 FB      [19]  303 	ld	-5 (ix),h
   40C8 DD 75 FA      [19]  304 	ld	-6 (ix),l
   40CB DD 7E F5      [19]  305 	ld	a,-11 (ix)
   40CE C6 FE         [ 7]  306 	add	a,#0xFE
   40D0 DD 77 F1      [19]  307 	ld	-15 (ix),a
   40D3 DD 7E F6      [19]  308 	ld	a,-10 (ix)
   40D6 CE FF         [ 7]  309 	adc	a,#0xFF
   40D8 DD 77 F2      [19]  310 	ld	-14 (ix),a
   40DB DD 7E F3      [19]  311 	ld	a,-13 (ix)
   40DE DD 96 F1      [19]  312 	sub	a, -15 (ix)
   40E1 DD 77 F1      [19]  313 	ld	-15 (ix),a
   40E4 DD 7E F4      [19]  314 	ld	a,-12 (ix)
   40E7 DD 9E F2      [19]  315 	sbc	a, -14 (ix)
   40EA DD 77 F2      [19]  316 	ld	-14 (ix),a
   40ED DD 6E F1      [19]  317 	ld	l,-15 (ix)
   40F0 DD 66 F2      [19]  318 	ld	h,-14 (ix)
   40F3 E5            [11]  319 	push	hl
   40F4 CD 60 4B      [17]  320 	call	_abs
   40F7 F1            [10]  321 	pop	af
   40F8 DD 74 F2      [19]  322 	ld	-14 (ix),h
   40FB DD 75 F1      [19]  323 	ld	-15 (ix),l
   40FE DD 7E FA      [19]  324 	ld	a,-6 (ix)
   4101 DD 86 F1      [19]  325 	add	a, -15 (ix)
   4104 DD 77 F1      [19]  326 	ld	-15 (ix),a
   4107 DD 7E FB      [19]  327 	ld	a,-5 (ix)
   410A DD 8E F2      [19]  328 	adc	a, -14 (ix)
   410D DD 77 F2      [19]  329 	ld	-14 (ix),a
   4110 DD 7E F1      [19]  330 	ld	a,-15 (ix)
   4113 DD 86 E1      [19]  331 	add	a, -31 (ix)
   4116 DD 77 F1      [19]  332 	ld	-15 (ix),a
   4119 DD 7E F2      [19]  333 	ld	a,-14 (ix)
   411C DD 8E E2      [19]  334 	adc	a, -30 (ix)
   411F DD 77 F2      [19]  335 	ld	-14 (ix),a
   4122 DD 7E F1      [19]  336 	ld	a,-15 (ix)
   4125 DD 77 ED      [19]  337 	ld	-19 (ix),a
   4128 DD 7E F2      [19]  338 	ld	a,-14 (ix)
   412B DD 77 EE      [19]  339 	ld	-18 (ix),a
                            340 ;src/pathfinding.c:81: resultado = 0;
   412E DD 36 EF 00   [19]  341 	ld	-17 (ix),#0x00
   4132                     342 00127$:
                            343 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 &&
   4132 DD 46 05      [19]  344 	ld	b,5 (ix)
   4135 04            [ 4]  345 	inc	b
   4136 04            [ 4]  346 	inc	b
   4137 C5            [11]  347 	push	bc
   4138 33            [ 6]  348 	inc	sp
   4139 DD 7E 04      [19]  349 	ld	a,4 (ix)
   413C F5            [11]  350 	push	af
   413D 33            [ 6]  351 	inc	sp
   413E DD 6E 08      [19]  352 	ld	l,8 (ix)
   4141 DD 66 09      [19]  353 	ld	h,9 (ix)
   4144 E5            [11]  354 	push	hl
   4145 CD 1C 4B      [17]  355 	call	_getTilePtr
   4148 F1            [10]  356 	pop	af
   4149 F1            [10]  357 	pop	af
   414A 4E            [ 7]  358 	ld	c,(hl)
   414B 3E 02         [ 7]  359 	ld	a,#0x02
   414D 91            [ 4]  360 	sub	a, c
   414E DA 17 42      [10]  361 	jp	C,00135$
                            362 ;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   4151 DD 7E 05      [19]  363 	ld	a,5 (ix)
   4154 C6 16         [ 7]  364 	add	a, #0x16
   4156 47            [ 4]  365 	ld	b,a
   4157 C5            [11]  366 	push	bc
   4158 33            [ 6]  367 	inc	sp
   4159 DD 7E F0      [19]  368 	ld	a,-16 (ix)
   415C F5            [11]  369 	push	af
   415D 33            [ 6]  370 	inc	sp
   415E DD 6E 08      [19]  371 	ld	l,8 (ix)
   4161 DD 66 09      [19]  372 	ld	h,9 (ix)
   4164 E5            [11]  373 	push	hl
   4165 CD 1C 4B      [17]  374 	call	_getTilePtr
   4168 F1            [10]  375 	pop	af
   4169 F1            [10]  376 	pop	af
   416A DD 74 F2      [19]  377 	ld	-14 (ix),h
   416D DD 75 F1      [19]  378 	ld	-15 (ix), l
   4170 DD 66 F2      [19]  379 	ld	h,-14 (ix)
   4173 7E            [ 7]  380 	ld	a,(hl)
   4174 DD 77 F1      [19]  381 	ld	-15 (ix),a
   4177 3E 02         [ 7]  382 	ld	a,#0x02
   4179 DD 96 F1      [19]  383 	sub	a, -15 (ix)
   417C DA 17 42      [10]  384 	jp	C,00135$
                            385 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   417F DD 6E F7      [19]  386 	ld	l,-9 (ix)
   4182 DD 66 F8      [19]  387 	ld	h,-8 (ix)
   4185 E5            [11]  388 	push	hl
   4186 CD 60 4B      [17]  389 	call	_abs
   4189 F1            [10]  390 	pop	af
   418A DD 74 F2      [19]  391 	ld	-14 (ix),h
   418D DD 75 F1      [19]  392 	ld	-15 (ix),l
   4190 DD 7E F5      [19]  393 	ld	a,-11 (ix)
   4193 C6 02         [ 7]  394 	add	a, #0x02
   4195 DD 77 FA      [19]  395 	ld	-6 (ix),a
   4198 DD 7E F6      [19]  396 	ld	a,-10 (ix)
   419B CE 00         [ 7]  397 	adc	a, #0x00
   419D DD 77 FB      [19]  398 	ld	-5 (ix),a
   41A0 DD 7E F3      [19]  399 	ld	a,-13 (ix)
   41A3 DD 96 FA      [19]  400 	sub	a, -6 (ix)
   41A6 DD 77 FA      [19]  401 	ld	-6 (ix),a
   41A9 DD 7E F4      [19]  402 	ld	a,-12 (ix)
   41AC DD 9E FB      [19]  403 	sbc	a, -5 (ix)
   41AF DD 77 FB      [19]  404 	ld	-5 (ix),a
   41B2 DD 6E FA      [19]  405 	ld	l,-6 (ix)
   41B5 DD 66 FB      [19]  406 	ld	h,-5 (ix)
   41B8 E5            [11]  407 	push	hl
   41B9 CD 60 4B      [17]  408 	call	_abs
   41BC F1            [10]  409 	pop	af
   41BD DD 74 FB      [19]  410 	ld	-5 (ix),h
   41C0 DD 75 FA      [19]  411 	ld	-6 (ix),l
   41C3 DD 7E F1      [19]  412 	ld	a,-15 (ix)
   41C6 DD 86 FA      [19]  413 	add	a, -6 (ix)
   41C9 DD 77 F1      [19]  414 	ld	-15 (ix),a
   41CC DD 7E F2      [19]  415 	ld	a,-14 (ix)
   41CF DD 8E FB      [19]  416 	adc	a, -5 (ix)
   41D2 DD 77 F2      [19]  417 	ld	-14 (ix),a
   41D5 DD 7E F1      [19]  418 	ld	a,-15 (ix)
   41D8 DD 86 E3      [19]  419 	add	a, -29 (ix)
   41DB DD 77 F1      [19]  420 	ld	-15 (ix),a
   41DE DD 7E F2      [19]  421 	ld	a,-14 (ix)
   41E1 DD 8E E4      [19]  422 	adc	a, -28 (ix)
   41E4 DD 77 F2      [19]  423 	ld	-14 (ix),a
   41E7 DD 7E F1      [19]  424 	ld	a,-15 (ix)
   41EA DD 77 EB      [19]  425 	ld	-21 (ix),a
   41ED DD 7E F2      [19]  426 	ld	a,-14 (ix)
   41F0 DD 77 EC      [19]  427 	ld	-20 (ix),a
                            428 ;src/pathfinding.c:87: if(resultado == 0){
   41F3 DD 7E EF      [19]  429 	ld	a,-17 (ix)
   41F6 B7            [ 4]  430 	or	a, a
   41F7 20 1A         [12]  431 	jr	NZ,00132$
                            432 ;src/pathfinding.c:88: if(dist1 > dist2)
   41F9 DD 7E EB      [19]  433 	ld	a,-21 (ix)
   41FC DD 96 ED      [19]  434 	sub	a, -19 (ix)
   41FF DD 7E EC      [19]  435 	ld	a,-20 (ix)
   4202 DD 9E EE      [19]  436 	sbc	a, -18 (ix)
   4205 E2 0A 42      [10]  437 	jp	PO, 00304$
   4208 EE 80         [ 7]  438 	xor	a, #0x80
   420A                     439 00304$:
   420A F2 17 42      [10]  440 	jp	P,00135$
                            441 ;src/pathfinding.c:89: resultado = 1;
   420D DD 36 EF 01   [19]  442 	ld	-17 (ix),#0x01
   4211 18 04         [12]  443 	jr	00135$
   4213                     444 00132$:
                            445 ;src/pathfinding.c:91: resultado = 1;
   4213 DD 36 EF 01   [19]  446 	ld	-17 (ix),#0x01
   4217                     447 00135$:
                            448 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4217 DD 4E 04      [19]  449 	ld	c,4 (ix)
   421A 0D            [ 4]  450 	dec	c
   421B C5            [11]  451 	push	bc
   421C DD 7E 05      [19]  452 	ld	a,5 (ix)
   421F F5            [11]  453 	push	af
   4220 33            [ 6]  454 	inc	sp
   4221 79            [ 4]  455 	ld	a,c
   4222 F5            [11]  456 	push	af
   4223 33            [ 6]  457 	inc	sp
   4224 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4227 DD 66 09      [19]  459 	ld	h,9 (ix)
   422A E5            [11]  460 	push	hl
   422B CD 1C 4B      [17]  461 	call	_getTilePtr
   422E F1            [10]  462 	pop	af
   422F F1            [10]  463 	pop	af
   4230 C1            [10]  464 	pop	bc
   4231 46            [ 7]  465 	ld	b,(hl)
                            466 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4232 DD 7E 05      [19]  467 	ld	a,5 (ix)
   4235 C6 14         [ 7]  468 	add	a, #0x14
   4237 DD 77 F1      [19]  469 	ld	-15 (ix),a
                            470 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   423A DD 7E 05      [19]  471 	ld	a,5 (ix)
   423D C6 0B         [ 7]  472 	add	a, #0x0B
   423F DD 77 FA      [19]  473 	ld	-6 (ix),a
                            474 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4242 DD 7E F3      [19]  475 	ld	a,-13 (ix)
   4245 DD 96 F5      [19]  476 	sub	a, -11 (ix)
   4248 DD 77 F7      [19]  477 	ld	-9 (ix),a
   424B DD 7E F4      [19]  478 	ld	a,-12 (ix)
   424E DD 9E F6      [19]  479 	sbc	a, -10 (ix)
   4251 DD 77 F8      [19]  480 	ld	-8 (ix),a
                            481 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4254 3E 02         [ 7]  482 	ld	a,#0x02
   4256 90            [ 4]  483 	sub	a, b
   4257 DA 01 43      [10]  484 	jp	C,00148$
                            485 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   425A C5            [11]  486 	push	bc
   425B DD 7E F1      [19]  487 	ld	a,-15 (ix)
   425E F5            [11]  488 	push	af
   425F 33            [ 6]  489 	inc	sp
   4260 79            [ 4]  490 	ld	a,c
   4261 F5            [11]  491 	push	af
   4262 33            [ 6]  492 	inc	sp
   4263 DD 6E 08      [19]  493 	ld	l,8 (ix)
   4266 DD 66 09      [19]  494 	ld	h,9 (ix)
   4269 E5            [11]  495 	push	hl
   426A CD 1C 4B      [17]  496 	call	_getTilePtr
   426D F1            [10]  497 	pop	af
   426E F1            [10]  498 	pop	af
   426F C1            [10]  499 	pop	bc
   4270 46            [ 7]  500 	ld	b,(hl)
   4271 3E 02         [ 7]  501 	ld	a,#0x02
   4273 90            [ 4]  502 	sub	a, b
   4274 DA 01 43      [10]  503 	jp	C,00148$
                            504 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4277 DD 7E FA      [19]  505 	ld	a,-6 (ix)
   427A F5            [11]  506 	push	af
   427B 33            [ 6]  507 	inc	sp
   427C 79            [ 4]  508 	ld	a,c
   427D F5            [11]  509 	push	af
   427E 33            [ 6]  510 	inc	sp
   427F DD 6E 08      [19]  511 	ld	l,8 (ix)
   4282 DD 66 09      [19]  512 	ld	h,9 (ix)
   4285 E5            [11]  513 	push	hl
   4286 CD 1C 4B      [17]  514 	call	_getTilePtr
   4289 F1            [10]  515 	pop	af
   428A F1            [10]  516 	pop	af
   428B 4E            [ 7]  517 	ld	c,(hl)
   428C 3E 02         [ 7]  518 	ld	a,#0x02
   428E 91            [ 4]  519 	sub	a, c
   428F 38 70         [12]  520 	jr	C,00148$
                            521 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4291 DD 4E FE      [19]  522 	ld	c,-2 (ix)
   4294 DD 46 FF      [19]  523 	ld	b,-1 (ix)
   4297 0B            [ 6]  524 	dec	bc
   4298 DD 7E FC      [19]  525 	ld	a,-4 (ix)
   429B 91            [ 4]  526 	sub	a, c
   429C 4F            [ 4]  527 	ld	c,a
   429D DD 7E FD      [19]  528 	ld	a,-3 (ix)
   42A0 98            [ 4]  529 	sbc	a, b
   42A1 47            [ 4]  530 	ld	b,a
   42A2 C5            [11]  531 	push	bc
   42A3 CD 60 4B      [17]  532 	call	_abs
   42A6 E3            [19]  533 	ex	(sp),hl
   42A7 DD 6E F7      [19]  534 	ld	l,-9 (ix)
   42AA DD 66 F8      [19]  535 	ld	h,-8 (ix)
   42AD E5            [11]  536 	push	hl
   42AE CD 60 4B      [17]  537 	call	_abs
   42B1 F1            [10]  538 	pop	af
   42B2 C1            [10]  539 	pop	bc
   42B3 09            [11]  540 	add	hl,bc
   42B4 D1            [10]  541 	pop	de
   42B5 D5            [11]  542 	push	de
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
   4313 CD 1C 4B      [17]  594 	call	_getTilePtr
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
   4326 DD 7E F1      [19]  606 	ld	a,-15 (ix)
   4329 F5            [11]  607 	push	af
   432A 33            [ 6]  608 	inc	sp
   432B C5            [11]  609 	push	bc
   432C 33            [ 6]  610 	inc	sp
   432D DD 6E 08      [19]  611 	ld	l,8 (ix)
   4330 DD 66 09      [19]  612 	ld	h,9 (ix)
   4333 E5            [11]  613 	push	hl
   4334 CD 1C 4B      [17]  614 	call	_getTilePtr
   4337 F1            [10]  615 	pop	af
   4338 F1            [10]  616 	pop	af
   4339 C1            [10]  617 	pop	bc
   433A 4E            [ 7]  618 	ld	c,(hl)
   433B 3E 02         [ 7]  619 	ld	a,#0x02
   433D 91            [ 4]  620 	sub	a, c
   433E DA 28 44      [10]  621 	jp	C,00167$
                            622 ;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4341 DD 7E FA      [19]  623 	ld	a,-6 (ix)
   4344 F5            [11]  624 	push	af
   4345 33            [ 6]  625 	inc	sp
   4346 C5            [11]  626 	push	bc
   4347 33            [ 6]  627 	inc	sp
   4348 DD 6E 08      [19]  628 	ld	l,8 (ix)
   434B DD 66 09      [19]  629 	ld	h,9 (ix)
   434E E5            [11]  630 	push	hl
   434F CD 1C 4B      [17]  631 	call	_getTilePtr
   4352 F1            [10]  632 	pop	af
   4353 F1            [10]  633 	pop	af
   4354 4E            [ 7]  634 	ld	c,(hl)
   4355 3E 02         [ 7]  635 	ld	a,#0x02
   4357 91            [ 4]  636 	sub	a, c
   4358 DA 28 44      [10]  637 	jp	C,00167$
                            638 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   435B DD 7E FE      [19]  639 	ld	a,-2 (ix)
   435E C6 01         [ 7]  640 	add	a, #0x01
   4360 DD 77 F1      [19]  641 	ld	-15 (ix),a
   4363 DD 7E FF      [19]  642 	ld	a,-1 (ix)
   4366 CE 00         [ 7]  643 	adc	a, #0x00
   4368 DD 77 F2      [19]  644 	ld	-14 (ix),a
   436B DD 7E FC      [19]  645 	ld	a,-4 (ix)
   436E DD 96 F1      [19]  646 	sub	a, -15 (ix)
   4371 DD 77 F1      [19]  647 	ld	-15 (ix),a
   4374 DD 7E FD      [19]  648 	ld	a,-3 (ix)
   4377 DD 9E F2      [19]  649 	sbc	a, -14 (ix)
   437A DD 77 F2      [19]  650 	ld	-14 (ix),a
   437D DD 6E F1      [19]  651 	ld	l,-15 (ix)
   4380 DD 66 F2      [19]  652 	ld	h,-14 (ix)
   4383 E5            [11]  653 	push	hl
   4384 CD 60 4B      [17]  654 	call	_abs
   4387 F1            [10]  655 	pop	af
   4388 DD 74 F2      [19]  656 	ld	-14 (ix),h
   438B DD 75 F1      [19]  657 	ld	-15 (ix),l
   438E DD 6E F7      [19]  658 	ld	l,-9 (ix)
   4391 DD 66 F8      [19]  659 	ld	h,-8 (ix)
   4394 E5            [11]  660 	push	hl
   4395 CD 60 4B      [17]  661 	call	_abs
   4398 F1            [10]  662 	pop	af
   4399 DD 74 FB      [19]  663 	ld	-5 (ix),h
   439C DD 75 FA      [19]  664 	ld	-6 (ix),l
   439F DD 7E F1      [19]  665 	ld	a,-15 (ix)
   43A2 DD 86 FA      [19]  666 	add	a, -6 (ix)
   43A5 DD 77 F1      [19]  667 	ld	-15 (ix),a
   43A8 DD 7E F2      [19]  668 	ld	a,-14 (ix)
   43AB DD 8E FB      [19]  669 	adc	a, -5 (ix)
   43AE DD 77 F2      [19]  670 	ld	-14 (ix),a
   43B1 DD 7E F1      [19]  671 	ld	a,-15 (ix)
   43B4 DD 86 E5      [19]  672 	add	a, -27 (ix)
   43B7 DD 77 E7      [19]  673 	ld	-25 (ix),a
   43BA DD 7E F2      [19]  674 	ld	a,-14 (ix)
   43BD DD 8E E6      [19]  675 	adc	a, -26 (ix)
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
   4438 21 F7 FF      [10]  744 	ld	hl,#-9
   443B 39            [11]  745 	add	hl,sp
   443C F9            [ 6]  746 	ld	sp,hl
                            747 ;src/pathfinding.c:144: u8 problem = 0;
   443D 1E 00         [ 7]  748 	ld	e,#0x00
                            749 ;src/pathfinding.c:146: x = s_x;
   443F DD 7E 04      [19]  750 	ld	a,4 (ix)
   4442 DD 77 F9      [19]  751 	ld	-7 (ix),a
                            752 ;src/pathfinding.c:147: sol_tam = 0;
   4445 21 FC 63      [10]  753 	ld	hl,#_sol_tam + 0
   4448 36 00         [10]  754 	ld	(hl), #0x00
                            755 ;src/pathfinding.c:148: y = s_y;
   444A DD 7E 05      [19]  756 	ld	a,5 (ix)
   444D DD 77 FB      [19]  757 	ld	-5 (ix),a
                            758 ;src/pathfinding.c:150: k = 0;
   4450 DD 36 F7 00   [19]  759 	ld	-9 (ix),#0x00
                            760 ;src/pathfinding.c:151: aux = 1;
   4454 DD 36 F8 01   [19]  761 	ld	-8 (ix),#0x01
                            762 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   4458 DD 7E 08      [19]  763 	ld	a,8 (ix)
   445B DD 77 FE      [19]  764 	ld	-2 (ix),a
   445E DD 7E 09      [19]  765 	ld	a,9 (ix)
   4461 DD 77 FF      [19]  766 	ld	-1 (ix),a
   4464 DD 7E FE      [19]  767 	ld	a,-2 (ix)
   4467 C6 E1         [ 7]  768 	add	a, #0xE1
   4469 4F            [ 4]  769 	ld	c,a
   446A DD 7E FF      [19]  770 	ld	a,-1 (ix)
   446D CE 00         [ 7]  771 	adc	a, #0x00
   446F 47            [ 4]  772 	ld	b,a
   4470 AF            [ 4]  773 	xor	a, a
   4471 02            [ 7]  774 	ld	(bc),a
                            775 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   4472 C5            [11]  776 	push	bc
   4473 D5            [11]  777 	push	de
   4474 DD 66 FB      [19]  778 	ld	h,-5 (ix)
   4477 DD 6E F9      [19]  779 	ld	l,-7 (ix)
   447A E5            [11]  780 	push	hl
   447B CD 0A 3F      [17]  781 	call	_anyadirALista
   447E F1            [10]  782 	pop	af
   447F D1            [10]  783 	pop	de
   4480 C1            [10]  784 	pop	bc
   4481 DD 75 FA      [19]  785 	ld	-6 (ix),l
                            786 ;src/pathfinding.c:157: while (aux){
   4484                     787 00114$:
   4484 DD 7E F8      [19]  788 	ld	a,-8 (ix)
   4487 B7            [ 4]  789 	or	a, a
   4488 CA 8B 45      [10]  790 	jp	Z,00116$
                            791 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   448B DD 7E 06      [19]  792 	ld	a,6 (ix)
   448E DD 96 F9      [19]  793 	sub	a, -7 (ix)
   4491 20 08         [12]  794 	jr	NZ,00113$
   4493 DD 7E 07      [19]  795 	ld	a,7 (ix)
   4496 DD 96 FB      [19]  796 	sub	a, -5 (ix)
   4499 28 06         [12]  797 	jr	Z,00109$
   449B                     798 00113$:
   449B DD 7E FA      [19]  799 	ld	a,-6 (ix)
   449E B7            [ 4]  800 	or	a, a
   449F 20 14         [12]  801 	jr	NZ,00110$
   44A1                     802 00109$:
                            803 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   44A1 DD 7E FA      [19]  804 	ld	a,-6 (ix)
   44A4 B7            [ 4]  805 	or	a, a
   44A5 28 06         [12]  806 	jr	Z,00101$
   44A7 3A FC 63      [13]  807 	ld	a,(#_sol_tam + 0)
   44AA B7            [ 4]  808 	or	a, a
   44AB 20 02         [12]  809 	jr	NZ,00102$
   44AD                     810 00101$:
                            811 ;src/pathfinding.c:161: problem = 1;
   44AD 1E 01         [ 7]  812 	ld	e,#0x01
   44AF                     813 00102$:
                            814 ;src/pathfinding.c:164: aux = 0;
   44AF DD 36 F8 00   [19]  815 	ld	-8 (ix),#0x00
   44B3 18 CF         [12]  816 	jr	00114$
   44B5                     817 00110$:
                            818 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   44B5 C5            [11]  819 	push	bc
   44B6 D5            [11]  820 	push	de
   44B7 DD 6E 0A      [19]  821 	ld	l,10 (ix)
   44BA DD 66 0B      [19]  822 	ld	h,11 (ix)
   44BD E5            [11]  823 	push	hl
   44BE DD 66 07      [19]  824 	ld	h,7 (ix)
   44C1 DD 6E 06      [19]  825 	ld	l,6 (ix)
   44C4 E5            [11]  826 	push	hl
   44C5 DD 66 FB      [19]  827 	ld	h,-5 (ix)
   44C8 DD 6E F9      [19]  828 	ld	l,-7 (ix)
   44CB E5            [11]  829 	push	hl
   44CC CD 52 3F      [17]  830 	call	_adjacentTiles
   44CF F1            [10]  831 	pop	af
   44D0 F1            [10]  832 	pop	af
   44D1 F1            [10]  833 	pop	af
   44D2 D1            [10]  834 	pop	de
   44D3 C1            [10]  835 	pop	bc
   44D4 55            [ 4]  836 	ld	d,l
                            837 ;src/pathfinding.c:168: switch(movimiento){
   44D5 3E 03         [ 7]  838 	ld	a,#0x03
   44D7 92            [ 4]  839 	sub	a, d
   44D8 38 AA         [12]  840 	jr	C,00114$
                            841 ;src/pathfinding.c:172: k = k+2;
   44DA DD 7E F7      [19]  842 	ld	a,-9 (ix)
   44DD C6 02         [ 7]  843 	add	a, #0x02
   44DF DD 77 FC      [19]  844 	ld	-4 (ix),a
                            845 ;src/pathfinding.c:168: switch(movimiento){
   44E2 D5            [11]  846 	push	de
   44E3 5A            [ 4]  847 	ld	e,d
   44E4 16 00         [ 7]  848 	ld	d,#0x00
   44E6 21 ED 44      [10]  849 	ld	hl,#00169$
   44E9 19            [11]  850 	add	hl,de
   44EA 19            [11]  851 	add	hl,de
                            852 ;src/pathfinding.c:169: case 0:
   44EB D1            [10]  853 	pop	de
   44EC E9            [ 4]  854 	jp	(hl)
   44ED                     855 00169$:
   44ED 18 06         [12]  856 	jr	00104$
   44EF 18 2D         [12]  857 	jr	00105$
   44F1 18 4E         [12]  858 	jr	00106$
   44F3 18 6E         [12]  859 	jr	00107$
   44F5                     860 00104$:
                            861 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   44F5 DD 7E FB      [19]  862 	ld	a,-5 (ix)
   44F8 C6 FE         [ 7]  863 	add	a,#0xFE
   44FA DD 77 FD      [19]  864 	ld	-3 (ix),a
   44FD C5            [11]  865 	push	bc
   44FE D5            [11]  866 	push	de
   44FF DD 66 FD      [19]  867 	ld	h,-3 (ix)
   4502 DD 6E F9      [19]  868 	ld	l,-7 (ix)
   4505 E5            [11]  869 	push	hl
   4506 CD 0A 3F      [17]  870 	call	_anyadirALista
   4509 F1            [10]  871 	pop	af
   450A D1            [10]  872 	pop	de
   450B C1            [10]  873 	pop	bc
   450C DD 75 FA      [19]  874 	ld	-6 (ix),l
                            875 ;src/pathfinding.c:171: y = y-2;
   450F DD 56 FD      [19]  876 	ld	d,-3 (ix)
   4512 DD 72 FB      [19]  877 	ld	-5 (ix),d
                            878 ;src/pathfinding.c:172: k = k+2;
   4515 DD 7E FC      [19]  879 	ld	a,-4 (ix)
   4518 DD 77 F7      [19]  880 	ld	-9 (ix),a
                            881 ;src/pathfinding.c:173: break;
   451B C3 84 44      [10]  882 	jp	00114$
                            883 ;src/pathfinding.c:174: case 1:
   451E                     884 00105$:
                            885 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   451E DD 56 FB      [19]  886 	ld	d,-5 (ix)
   4521 14            [ 4]  887 	inc	d
   4522 14            [ 4]  888 	inc	d
   4523 C5            [11]  889 	push	bc
   4524 D5            [11]  890 	push	de
   4525 D5            [11]  891 	push	de
   4526 33            [ 6]  892 	inc	sp
   4527 DD 7E F9      [19]  893 	ld	a,-7 (ix)
   452A F5            [11]  894 	push	af
   452B 33            [ 6]  895 	inc	sp
   452C CD 0A 3F      [17]  896 	call	_anyadirALista
   452F F1            [10]  897 	pop	af
   4530 D1            [10]  898 	pop	de
   4531 C1            [10]  899 	pop	bc
   4532 DD 75 FA      [19]  900 	ld	-6 (ix),l
                            901 ;src/pathfinding.c:178: y = y+2;
   4535 DD 72 FB      [19]  902 	ld	-5 (ix),d
                            903 ;src/pathfinding.c:179: k = k+2;
   4538 DD 7E FC      [19]  904 	ld	a,-4 (ix)
   453B DD 77 F7      [19]  905 	ld	-9 (ix),a
                            906 ;src/pathfinding.c:180: break;
   453E C3 84 44      [10]  907 	jp	00114$
                            908 ;src/pathfinding.c:181: case 2:
   4541                     909 00106$:
                            910 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4541 DD 56 F9      [19]  911 	ld	d,-7 (ix)
   4544 15            [ 4]  912 	dec	d
   4545 C5            [11]  913 	push	bc
   4546 D5            [11]  914 	push	de
   4547 DD 7E FB      [19]  915 	ld	a,-5 (ix)
   454A F5            [11]  916 	push	af
   454B 33            [ 6]  917 	inc	sp
   454C D5            [11]  918 	push	de
   454D 33            [ 6]  919 	inc	sp
   454E CD 0A 3F      [17]  920 	call	_anyadirALista
   4551 F1            [10]  921 	pop	af
   4552 D1            [10]  922 	pop	de
   4553 C1            [10]  923 	pop	bc
   4554 DD 75 FA      [19]  924 	ld	-6 (ix),l
                            925 ;src/pathfinding.c:185: x = x-1;
   4557 DD 72 F9      [19]  926 	ld	-7 (ix),d
                            927 ;src/pathfinding.c:186: k = k+2;
   455A DD 7E FC      [19]  928 	ld	a,-4 (ix)
   455D DD 77 F7      [19]  929 	ld	-9 (ix),a
                            930 ;src/pathfinding.c:187: break;
   4560 C3 84 44      [10]  931 	jp	00114$
                            932 ;src/pathfinding.c:188: case 3:
   4563                     933 00107$:
                            934 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4563 DD 7E F9      [19]  935 	ld	a,-7 (ix)
   4566 3C            [ 4]  936 	inc	a
   4567 DD 77 FD      [19]  937 	ld	-3 (ix),a
   456A C5            [11]  938 	push	bc
   456B D5            [11]  939 	push	de
   456C DD 66 FB      [19]  940 	ld	h,-5 (ix)
   456F DD 6E FD      [19]  941 	ld	l,-3 (ix)
   4572 E5            [11]  942 	push	hl
   4573 CD 0A 3F      [17]  943 	call	_anyadirALista
   4576 F1            [10]  944 	pop	af
   4577 D1            [10]  945 	pop	de
   4578 C1            [10]  946 	pop	bc
   4579 DD 75 FA      [19]  947 	ld	-6 (ix),l
                            948 ;src/pathfinding.c:190: x = x+1;
   457C DD 6E FD      [19]  949 	ld	l,-3 (ix)
   457F DD 75 F9      [19]  950 	ld	-7 (ix),l
                            951 ;src/pathfinding.c:191: k = k+2;
   4582 DD 7E FC      [19]  952 	ld	a,-4 (ix)
   4585 DD 77 F7      [19]  953 	ld	-9 (ix),a
                            954 ;src/pathfinding.c:194: }
   4588 C3 84 44      [10]  955 	jp	00114$
   458B                     956 00116$:
                            957 ;src/pathfinding.c:199: if(problem == 0){
   458B 7B            [ 4]  958 	ld	a,e
   458C B7            [ 4]  959 	or	a, a
   458D 20 44         [12]  960 	jr	NZ,00122$
                            961 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            962 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   458F 3A FC 63      [13]  963 	ld	a,(#_sol_tam + 0)
   4592 FE C8         [ 7]  964 	cp	a,#0xC8
   4594 30 03         [12]  965 	jr	NC,00118$
   4596 02            [ 7]  966 	ld	(bc),a
   4597 18 03         [12]  967 	jr	00137$
   4599                     968 00118$:
                            969 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   4599 3E C8         [ 7]  970 	ld	a,#0xC8
   459B 02            [ 7]  971 	ld	(bc),a
                            972 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   459C                     973 00137$:
   459C DD 7E FE      [19]  974 	ld	a,-2 (ix)
   459F C6 19         [ 7]  975 	add	a, #0x19
   45A1 DD 77 FE      [19]  976 	ld	-2 (ix),a
   45A4 DD 7E FF      [19]  977 	ld	a,-1 (ix)
   45A7 CE 00         [ 7]  978 	adc	a, #0x00
   45A9 DD 77 FF      [19]  979 	ld	-1 (ix),a
   45AC 1E 00         [ 7]  980 	ld	e,#0x00
   45AE                     981 00125$:
   45AE 0A            [ 7]  982 	ld	a,(bc)
   45AF 57            [ 4]  983 	ld	d,a
   45B0 7B            [ 4]  984 	ld	a,e
   45B1 92            [ 4]  985 	sub	a, d
   45B2 30 21         [12]  986 	jr	NC,00127$
                            987 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   45B4 E5            [11]  988 	push	hl
   45B5 6B            [ 4]  989 	ld	l,e
   45B6 26 00         [ 7]  990 	ld	h,#0x00
   45B8 E5            [11]  991 	push	hl
   45B9 FD E1         [14]  992 	pop	iy
   45BB E1            [10]  993 	pop	hl
   45BC C5            [11]  994 	push	bc
   45BD DD 4E FE      [19]  995 	ld	c,-2 (ix)
   45C0 DD 46 FF      [19]  996 	ld	b,-1 (ix)
   45C3 FD 09         [15]  997 	add	iy, bc
   45C5 C1            [10]  998 	pop	bc
   45C6 21 FD 63      [10]  999 	ld	hl,#_camino
   45C9 16 00         [ 7] 1000 	ld	d,#0x00
   45CB 19            [11] 1001 	add	hl, de
   45CC 56            [ 7] 1002 	ld	d,(hl)
   45CD FD 72 00      [19] 1003 	ld	0 (iy), d
                           1004 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   45D0 1C            [ 4] 1005 	inc	e
   45D1 18 DB         [12] 1006 	jr	00125$
   45D3                    1007 00122$:
                           1008 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   45D3 AF            [ 4] 1009 	xor	a, a
   45D4 02            [ 7] 1010 	ld	(bc),a
   45D5                    1011 00127$:
   45D5 DD F9         [10] 1012 	ld	sp, ix
   45D7 DD E1         [14] 1013 	pop	ix
   45D9 C9            [10] 1014 	ret
                           1015 	.area _CODE
                           1016 	.area _INITIALIZER
                           1017 	.area _CABS (ABS)
