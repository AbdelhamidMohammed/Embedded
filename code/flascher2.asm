
_main:

;flascher2.c,3 :: 		void main() {
;flascher2.c,4 :: 		adcon1=0x07;trisD=0; trisc=0;portc=0;
	MOVLW      7
	MOVWF      ADCON1+0
	CLRF       TRISD+0
	CLRF       TRISC+0
	CLRF       PORTC+0
;flascher2.c,5 :: 		trisa.b0=1;
	BSF        TRISA+0, 0
;flascher2.c,6 :: 		porta.b0=0;
	BCF        PORTA+0, 0
;flascher2.c,7 :: 		trisa.b0=1;
	BSF        TRISA+0, 0
;flascher2.c,8 :: 		porta.b1=0;
	BCF        PORTA+0, 1
;flascher2.c,9 :: 		trisb.b0=0;trisb.b1=0;
	BCF        TRISB+0, 0
	BCF        TRISB+0, 1
;flascher2.c,10 :: 		trisb.b2=0;trisb.b3=0;
	BCF        TRISB+0, 2
	BCF        TRISB+0, 3
;flascher2.c,11 :: 		portb.B1=0;portb.B0=0;
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
;flascher2.c,12 :: 		portb.B2=0;portb.B3=0;
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
;flascher2.c,13 :: 		portd=0;
	CLRF       PORTD+0
;flascher2.c,14 :: 		while(1)
L_main0:
;flascher2.c,16 :: 		portd=0;
	CLRF       PORTD+0
;flascher2.c,17 :: 		while(porta.b0)
L_main2:
	BTFSS      PORTA+0, 0
	GOTO       L_main3
;flascher2.c,18 :: 		{  portd=0;
	CLRF       PORTD+0
;flascher2.c,19 :: 		for(count=35;count>=0;count--){
	MOVLW      35
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main4:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      0
	SUBWF      _count+0, 0
L__main59:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;flascher2.c,20 :: 		if(porta.b0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_main7
;flascher2.c,21 :: 		portc=0;portd=0;
	CLRF       PORTC+0
	CLRF       PORTD+0
;flascher2.c,22 :: 		break;}
	GOTO       L_main5
L_main7:
;flascher2.c,23 :: 		portD.B0=1;//  traffic1 red led on
	BSF        PORTD+0, 0
;flascher2.c,24 :: 		portD.b4=1;//  traffic2 green led on
	BSF        PORTD+0, 4
;flascher2.c,25 :: 		if(count<=3){portD.b5=1;portD.b4=0;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVF       _count+0, 0
	SUBLW      3
L__main60:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
L_main8:
;flascher2.c,26 :: 		if((count<=31&&count>=26)||(count<=15&&count>=10)) continue;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVF       _count+0, 0
	SUBLW      31
L__main61:
	BTFSS      STATUS+0, 0
	GOTO       L__main57
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      26
	SUBWF      _count+0, 0
L__main62:
	BTFSS      STATUS+0, 0
	GOTO       L__main57
	GOTO       L__main55
L__main57:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVF       _count+0, 0
	SUBLW      15
L__main63:
	BTFSS      STATUS+0, 0
	GOTO       L__main56
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      10
	SUBWF      _count+0, 0
L__main64:
	BTFSS      STATUS+0, 0
	GOTO       L__main56
	GOTO       L__main55
L__main56:
	GOTO       L_main15
L__main55:
	GOTO       L_main6
L_main15:
;flascher2.c,27 :: 		portc=count;    //port that 7segment work on
	MOVF       _count+0, 0
	MOVWF      PORTC+0
;flascher2.c,28 :: 		delay_ms(500);}
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
L_main6:
;flascher2.c,19 :: 		for(count=35;count>=0;count--){
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;flascher2.c,28 :: 		delay_ms(500);}
	GOTO       L_main4
L_main5:
;flascher2.c,29 :: 		for(count=21;count>=0;count--){if(porta.b0==0){
	MOVLW      21
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main17:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      0
	SUBWF      _count+0, 0
L__main65:
	BTFSS      STATUS+0, 0
	GOTO       L_main18
	BTFSC      PORTA+0, 0
	GOTO       L_main20
;flascher2.c,30 :: 		portc=0;portd=0;
	CLRF       PORTC+0
	CLRF       PORTD+0
;flascher2.c,31 :: 		break;}
	GOTO       L_main18
L_main20:
;flascher2.c,32 :: 		portD.B0=0;
	BCF        PORTD+0, 0
;flascher2.c,33 :: 		portD.b5=0;
	BCF        PORTD+0, 5
;flascher2.c,34 :: 		portD.B3=1;
	BSF        PORTD+0, 3
;flascher2.c,35 :: 		portD.b1=1;
	BSF        PORTD+0, 1
;flascher2.c,36 :: 		if(count<=3){portD.b1=0;portD.b2=1;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       _count+0, 0
	SUBLW      3
L__main66:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
	BCF        PORTD+0, 1
	BSF        PORTD+0, 2
L_main21:
;flascher2.c,37 :: 		if((count<=15&&count>=10)) continue;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVF       _count+0, 0
	SUBLW      15
L__main67:
	BTFSS      STATUS+0, 0
	GOTO       L_main24
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      10
	SUBWF      _count+0, 0
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main24
L__main54:
	GOTO       L_main19
L_main24:
;flascher2.c,38 :: 		portc=count;
	MOVF       _count+0, 0
	MOVWF      PORTC+0
;flascher2.c,39 :: 		delay_ms(500);}}
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
L_main19:
;flascher2.c,29 :: 		for(count=21;count>=0;count--){if(porta.b0==0){
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;flascher2.c,39 :: 		delay_ms(500);}}
	GOTO       L_main17
L_main18:
	GOTO       L_main2
L_main3:
;flascher2.c,40 :: 		while(porta.b0==0){
L_main26:
	BTFSC      PORTA+0, 0
	GOTO       L_main27
;flascher2.c,41 :: 		while(1){
L_main28:
;flascher2.c,42 :: 		portd=0;if(porta.b0==1)break;
	CLRF       PORTD+0
	BTFSS      PORTA+0, 0
	GOTO       L_main30
	GOTO       L_main29
L_main30:
;flascher2.c,43 :: 		while(porta.b1)
L_main31:
	BTFSS      PORTA+0, 1
	GOTO       L_main32
;flascher2.c,44 :: 		{  flag=0;
	CLRF       _flag+0
	CLRF       _flag+1
;flascher2.c,45 :: 		while(flag1%2==0){
L_main33:
	MOVLW      2
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       flascher2_flag1+0, 0
	MOVWF      R0+0
	MOVF       flascher2_flag1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      0
	XORWF      R0+0, 0
L__main69:
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;flascher2.c,46 :: 		if(porta.b0==1)break;
	BTFSS      PORTA+0, 0
	GOTO       L_main35
	GOTO       L_main34
L_main35:
;flascher2.c,47 :: 		portD.b2=0;
	BCF        PORTD+0, 2
;flascher2.c,48 :: 		portD.b0=1;//  traffic1 red led on
	BSF        PORTD+0, 0
;flascher2.c,49 :: 		portD.b4=1;//  traffic2 green led on
	BSF        PORTD+0, 4
;flascher2.c,50 :: 		portc=0;
	CLRF       PORTC+0
;flascher2.c,51 :: 		if(porta.b1==0)break;
	BTFSC      PORTA+0, 1
	GOTO       L_main36
	GOTO       L_main34
L_main36:
;flascher2.c,52 :: 		}
	GOTO       L_main33
L_main34:
;flascher2.c,53 :: 		while(flag1%2!=0) {
L_main37:
	MOVLW      2
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       flascher2_flag1+0, 0
	MOVWF      R0+0
	MOVF       flascher2_flag1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      0
	XORWF      R0+0, 0
L__main70:
	BTFSC      STATUS+0, 2
	GOTO       L_main38
;flascher2.c,54 :: 		if(porta.b0==1)break;
	BTFSS      PORTA+0, 0
	GOTO       L_main39
	GOTO       L_main38
L_main39:
;flascher2.c,55 :: 		flag2=0;
	CLRF       _flag2+0
	CLRF       _flag2+1
;flascher2.c,56 :: 		if (flag2==0){for(count=3;count>=0;count--){portc=count; portD.b2=1;portD.b4=1;delay_ms(500);}} //  traffic1 yellow led on}
	MOVLW      3
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main41:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      0
	SUBWF      _count+0, 0
L__main71:
	BTFSS      STATUS+0, 0
	GOTO       L_main42
	MOVF       _count+0, 0
	MOVWF      PORTC+0
	BSF        PORTD+0, 2
	BSF        PORTD+0, 4
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	DECFSZ     R11+0, 1
	GOTO       L_main44
	NOP
	NOP
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
	GOTO       L_main41
L_main42:
;flascher2.c,57 :: 		flag2++;
	INCF       _flag2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _flag2+1, 1
;flascher2.c,58 :: 		flag1++;
	INCF       flascher2_flag1+0, 1
	BTFSC      STATUS+0, 2
	INCF       flascher2_flag1+1, 1
;flascher2.c,59 :: 		portD.b2=0;  //turn off yellow2
	BCF        PORTD+0, 2
;flascher2.c,60 :: 		portD.b0=1;//  traffic1 red led on
	BSF        PORTD+0, 0
;flascher2.c,61 :: 		portD.b4=1;//  traffic2 green led on
	BSF        PORTD+0, 4
;flascher2.c,62 :: 		portc=0;
	CLRF       PORTC+0
;flascher2.c,63 :: 		if(porta.b1==0)break;}
	BTFSC      PORTA+0, 1
	GOTO       L_main45
	GOTO       L_main38
L_main45:
	GOTO       L_main37
L_main38:
;flascher2.c,64 :: 		}
	GOTO       L_main31
L_main32:
;flascher2.c,65 :: 		flag1++;
	INCF       flascher2_flag1+0, 1
	BTFSC      STATUS+0, 2
	INCF       flascher2_flag1+1, 1
;flascher2.c,66 :: 		while (porta.B1==0)
L_main46:
	BTFSC      PORTA+0, 1
	GOTO       L_main47
;flascher2.c,68 :: 		{if(porta.b0==1)break;
	BTFSS      PORTA+0, 0
	GOTO       L_main48
	GOTO       L_main47
L_main48:
;flascher2.c,69 :: 		portD.b0=0;
	BCF        PORTD+0, 0
;flascher2.c,70 :: 		portD.b4=0;
	BCF        PORTD+0, 4
;flascher2.c,71 :: 		portD.B1=1;
	BSF        PORTD+0, 1
;flascher2.c,72 :: 		if (flag!=1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      1
	XORWF      _flag+0, 0
L__main72:
	BTFSC      STATUS+0, 2
	GOTO       L_main49
;flascher2.c,73 :: 		for(count=3;count>=0;count--) {portc=count;portD.B5=1;delay_ms(500);}}//  traffic1 yellow led on}
	MOVLW      3
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main50:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      0
	SUBWF      _count+0, 0
L__main73:
	BTFSS      STATUS+0, 0
	GOTO       L_main51
	MOVF       _count+0, 0
	MOVWF      PORTC+0
	BSF        PORTD+0, 5
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
	GOTO       L_main50
L_main51:
L_main49:
;flascher2.c,74 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;flascher2.c,75 :: 		portD.B5=0;
	BCF        PORTD+0, 5
;flascher2.c,76 :: 		portD.B2=0;//  traffic1 yellow led off            //  traffic1 green led on
	BCF        PORTD+0, 2
;flascher2.c,77 :: 		portD.b3=1;//  traffic2 red led on
	BSF        PORTD+0, 3
;flascher2.c,78 :: 		} }}portd=0;}}
	GOTO       L_main46
L_main47:
	GOTO       L_main28
L_main29:
	GOTO       L_main26
L_main27:
	CLRF       PORTD+0
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
