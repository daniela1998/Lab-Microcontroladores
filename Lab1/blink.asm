;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"dado.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_dado_0	udata
r0x1008	res	1
r0x1009	res	1
r0x100B	res	1
r0x100A	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_dado	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;9 compiler assigned registers:
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   STK00
;; Starting pCode block
S_dado__main	code
_main:
; 2 exit points
;	.line	12; "dado.c"	TRISIO = 0b00001000;
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	14; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	16; "dado.c"	int rand_num =0b001;
	MOVLW	0x01
	MOVWF	r0x1008
	CLRF	r0x1009
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=1, same=0, offr=0
_00120_DS_:
;	.line	26; "dado.c"	new=(rand_num ^ (rand_num >> 1)) & 1;
	BCF	STATUS,0
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,W
	MOVWF	r0x100A
	RRF	r0x1008,W
	MOVWF	r0x100B
	XORWF	r0x1008,W
	MOVWF	r0x100C
	MOVF	r0x100A,W
	XORWF	r0x1009,W
	MOVWF	r0x100D
	MOVLW	0x01
	ANDWF	r0x100C,F
	CLRF	r0x100D
;	.line	27; "dado.c"	rand_num= (rand_num >> 1) | (new << 2);
	BCF	STATUS,0
	RLF	r0x100C,W
	MOVWF	r0x100E
	RLF	r0x100D,W
	MOVWF	r0x100F
	BCF	STATUS,0
	RLF	r0x100E,F
	RLF	r0x100F,F
	MOVF	r0x100E,W
	IORWF	r0x100B,W
	MOVWF	r0x1008
	MOVF	r0x100F,W
	IORWF	r0x100A,W
	MOVWF	r0x1009
;	.line	29; "dado.c"	if (GP3)
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00120_DS_
;	.line	32; "dado.c"	if (rand_num == 0b001){
	MOVF	r0x1008,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00106_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	34; "dado.c"	GPIO = 0b00000010;
	MOVLW	0x02
	MOVWF	_GPIO
;	.line	35; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	36; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00106_DS_:
;	.line	39; "dado.c"	if(rand_num == 0b010){
	MOVF	r0x1008,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00108_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	40; "dado.c"	GPIO = 0b00000100;
	MOVLW	0x04
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	41; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	42; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00108_DS_:
;	.line	45; "dado.c"	if (rand_num == 0b011){
	MOVF	r0x1008,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00110_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	46; "dado.c"	GPIO = 0b00000110;
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	47; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	48; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00110_DS_:
;	.line	51; "dado.c"	if (rand_num == 0b100){
	MOVF	r0x1008,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00112_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	52; "dado.c"	GPIO = 0b00000101;
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	53; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	54; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00112_DS_:
;	.line	57; "dado.c"	if (rand_num == 0b101){
	MOVF	r0x1008,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00114_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	58; "dado.c"	GPIO = 0b00000111;
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	59; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	60; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00114_DS_:
;	.line	63; "dado.c"	if (rand_num == 0b110){
	MOVF	r0x1008,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00120_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00120_DS_
;	.line	64; "dado.c"	GPIO = 0b00010101;
	MOVLW	0x15
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	65; "dado.c"	delay(time);
	MOVLW	0xe8
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	66; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
	GOTO	_00120_DS_
;	.line	70; "dado.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_dado__delay	code
_delay:
; 2 exit points
;	.line	73; "dado.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	78; "dado.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00131_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00152_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00152_DS_:
	BTFSC	STATUS,0
	GOTO	_00133_DS_
;;genSkipc:3307: created from rifx:0x7ffd0b2763e0
;	.line	79; "dado.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00129_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00129_DS_
;	.line	78; "dado.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00131_DS_
_00133_DS_:
;	.line	80; "dado.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  168+   26 =   194 instructions (  440 byte)

	end
