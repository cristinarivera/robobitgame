;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module tiles2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tiles2_09
	.globl _g_tiles2_08
	.globl _g_tiles2_07
	.globl _g_tiles2_06
	.globl _g_tiles2_05
	.globl _g_tiles2_04
	.globl _g_tiles2_03
	.globl _g_tiles2_02
	.globl _g_tiles2_01
	.globl _g_tiles2_00
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_g_tiles2_00:
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC6	; 198
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC6	; 198
_g_tiles2_01:
	.db #0xCC	; 204
	.db #0xCF	; 207
	.db #0xCE	; 206
	.db #0xC9	; 201
	.db #0xCB	; 203
	.db #0xCC	; 204
	.db #0xCB	; 203
	.db #0xCE	; 206
_g_tiles2_02:
	.db #0xCE	; 206
	.db #0xCD	; 205
	.db #0xC7	; 199
	.db #0xCC	; 204
	.db #0xC3	; 195
	.db #0xCE	; 206
	.db #0xC9	; 201
	.db #0xC7	; 199
_g_tiles2_03:
	.db #0xCC	; 204
	.db #0xCF	; 207
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCE	; 206
	.db #0xCF	; 207
	.db #0xCE	; 206
	.db #0xCF	; 207
_g_tiles2_04:
	.db #0xCF	; 207
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCF	; 207
	.db #0xCD	; 205
	.db #0xCF	; 207
	.db #0xCD	; 205
_g_tiles2_05:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_tiles2_06:
	.db #0xCB	; 203
	.db #0xCF	; 207
	.db #0xC9	; 201
	.db #0xC7	; 199
	.db #0xCC	; 204
	.db #0xC3	; 195
	.db #0xCE	; 206
	.db #0xCF	; 207
_g_tiles2_07:
	.db #0xCC	; 204
	.db #0xC7	; 199
	.db #0xCE	; 206
	.db #0xCD	; 205
	.db #0xC3	; 195
	.db #0xCC	; 204
	.db #0xCF	; 207
	.db #0xCE	; 206
_g_tiles2_08:
	.db #0xCE	; 206
	.db #0xCF	; 207
	.db #0xCE	; 206
	.db #0xCF	; 207
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCF	; 207
_g_tiles2_09:
	.db #0xCF	; 207
	.db #0xCD	; 205
	.db #0xCF	; 207
	.db #0xCD	; 205
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCF	; 207
	.db #0xCC	; 204
	.area _INITIALIZER
	.area _CABS (ABS)
