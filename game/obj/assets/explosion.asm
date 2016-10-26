;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module explosion
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_explosion
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
_g_explosion:
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x64	; 100	'd'
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x98	; 152
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x98	; 152
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x20	; 32
	.db #0x98	; 152
	.db #0x0F	; 15
	.db #0x25	; 37
	.db #0x88	; 136
	.db #0xCC	; 204
	.db #0x5B	; 91
	.db #0x1A	; 26
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x25	; 37
	.db #0x30	; 48	'0'
	.db #0xCC	; 204
	.db #0x98	; 152
	.db #0x8D	; 141
	.db #0x4E	; 78	'N'
	.db #0xCC	; 204
	.db #0x98	; 152
	.db #0x5B	; 91
	.db #0x1A	; 26
	.db #0xCC	; 204
	.db #0x98	; 152
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x64	; 100	'd'
	.db #0x98	; 152
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0xCC	; 204
	.db #0x8D	; 141
	.db #0x25	; 37
	.db #0x0F	; 15
	.db #0xCC	; 204
	.db #0x98	; 152
	.db #0x0F	; 15
	.db #0x1A	; 26
	.db #0xCC	; 204
	.db #0x98	; 152
	.db #0x1A	; 26
	.db #0x0F	; 15
	.db #0xC9	; 201
	.db #0xCC	; 204
	.db #0x30	; 48	'0'
	.db #0x25	; 37
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x41	; 65	'A'
	.db #0xCC	; 204
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x64	; 100	'd'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xCC	; 204
	.db #0x88	; 136
	.area _INITIALIZER
	.area _CABS (ABS)