#line 1 "C:/Users/ok/Desktop/Embeded system/day1/video2/code/flascher2.c"
int count=0,left=0,right=0,flag=0,flag2=0;
static int flag1=0;
 void main() {
 adcon1=0x07;trisD=0; trisc=0;portc=0;
 trisa.b0=1;
 porta.b0=0;
 trisa.b0=1;
 porta.b1=0;
 trisb.b0=0;trisb.b1=0;
 trisb.b2=0;trisb.b3=0;
 portb.B1=0;portb.B0=0;
 portb.B2=0;portb.B3=0;
 portd=0;
 while(1)
 {
 portd=0;
 while(porta.b0)
 { portd=0;
 for(count=35;count>=0;count--){
 if(porta.b0==0){
 portc=0;portd=0;
 break;}
 portD.B0=1;
 portD.b4=1;
 if(count<=3){portD.b5=1;portD.b4=0;}
 if((count<=31&&count>=26)||(count<=15&&count>=10)) continue;
 portc=count;
 delay_ms(1000);}
 for(count=21;count>=0;count--){if(porta.b0==0){
 portc=0;portd=0;
 break;}
 portD.B0=0;
 portD.b5=0;
 portD.B3=1;
 portD.b1=1;
 if(count<=3){portD.b1=0;portD.b2=1;}
 if((count<=15&&count>=10)) continue;
 portc=count;
 delay_ms(1000);}}
 while(porta.b0==0){
 while(1){
 portd=0;if(porta.b0==1)break;
 while(porta.b1)
 { flag=0;
 while(flag1%2==0){
 if(porta.b0==1)break;
 portD.b2=0;
 portD.b0=1;
 portD.b4=1;
 portc=0;
 if(porta.b1==0)break;
 }
 while(flag1%2!=0) {
 if(porta.b0==1)break;
 flag2=0;
 if (flag2==0){for(count=3;count>=0;count--){portc=count; portD.b2=1;portD.b4=1;delay_ms(1000);}}
 flag2++;
 flag1++;
 portD.b2=0;
 portD.b0=1;
 portD.b4=1;
 portc=0;
 if(porta.b1==0)break;}
 }
 flag1++;
 while (porta.B1==0)

 {if(porta.b0==1)break;
 portD.b0=0;
 portD.b4=0;
 portD.B1=1;
 if (flag!=1){
 for(count=3;count>=0;count--) {portc=count;portD.B5=1;delay_ms(1000);}}
 flag=1;
 portD.B5=0;
 portD.B2=0;
 portD.b3=1;
 } }}portd=0;}}
