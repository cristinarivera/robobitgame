;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module tiles
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tiles_09
	.globl _g_tiles_08
	.globl _g_tiles_07
	.globl _g_tiles_06
	.globl _g_tiles_05
	.globl _g_tiles_04
	.globl _g_tiles_03
	.globl _g_tiles_02
	.globl _g_tiles_01
	.globl _g_tiles_00
	.globl _g_tileset
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
_g_tileset:
	.dw _g_tiles_00
	.dw _g_tiles_01
	.dw _g_tiles_02
	.dw _g_tiles_03
	.dw _g_tiles_04
	.dw _g_tiles_05
	.dw _g_tiles_06
	.dw _g_tiles_07
	.dw _g_tiles_08
	.dw _g_tiles_09
_g_tiles_00:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x57	; 87	'W'
_g_tiles_01:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xAC	; 172
	.db #0xFC	; 252
	.db #0xAC	; 172
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_tiles_02:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x5C	; 92
	.db #0xFC	; 252
	.db #0x5C	; 92
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_tiles_03:
	.db #0x3C	; 60
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0xBC	; 188
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xBC	; 188
	.db #0xBC	; 188
_g_tiles_04:
	.db #0xFC	; 252
	.db #0x3C	; 60
	.db #0x7C	; 124
	.db #0xBC	; 188
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0x7C	; 124
_g_tiles_05:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_tiles_06:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xAC	; 172
	.db #0xFC	; 252
	.db #0xAC	; 172
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_tiles_07:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x5C	; 92
	.db #0xFC	; 252
	.db #0x5C	; 92
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_tiles_08:
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0xBC	; 188
	.db #0x3C	; 60
	.db #0xFC	; 252
_g_tiles_09:
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0xBC	; 188
	.db #0xFC	; 252
	.db #0x3C	; 60
	.area _INITIALIZER
	.area _CABS (ABS)
