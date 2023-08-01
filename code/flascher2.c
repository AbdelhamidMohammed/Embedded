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
     {  portd=0;
        for(count=35;count>=0;count--){
          if(porta.b0==0){
          portc=0;portd=0;
          break;}
      portD.B0=1;//  traffic1 red led on
      portD.b4=1;//  traffic2 green led on
      if(count<=3){portD.b5=1;portD.b4=0;}
      if((count<=31&&count>=26)||(count<=15&&count>=10)) continue;
      portc=count;    //port that 7segment work on
      delay_ms(500);}
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
        delay_ms(500);}}
    while(porta.b0==0){
    while(1){
    portd=0;if(porta.b0==1)break;
    while(porta.b1)
    {  flag=0;
       while(flag1%2==0){
       if(porta.b0==1)break;
       portD.b2=0;
       portD.b0=1;//  traffic1 red led on
       portD.b4=1;//  traffic2 green led on
       portc=0;
       if(porta.b1==0)break;
       }
       while(flag1%2!=0) {
       if(porta.b0==1)break;
       flag2=0;
        if (flag2==0){for(count=3;count>=0;count--){portc=count; portD.b2=1;portD.b4=1;delay_ms(500);}} //  traffic1 yellow led on}
         flag2++;
         flag1++;
         portD.b2=0;  //turn off yellow2
         portD.b0=1;//  traffic1 red led on
         portD.b4=1;//  traffic2 green led on
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
      for(count=3;count>=0;count--) {portc=count;portD.B5=1;delay_ms(500);}}//  traffic1 yellow led on}
        flag=1;
        portD.B5=0;
         portD.B2=0;//  traffic1 yellow led off            //  traffic1 green led on
         portD.b3=1;//  traffic2 red led on
      } }}portd=0;}}

 /*   
 31 30 29 28
   27 26 1514 13
   12 11 10
       35 34 33 32 25 24 23 22 21 20 19 18 17 16  9
       23 22 21 20 19 18 17 16 15 14 13 12 11 10  9
  
      //35->3>>>traffic 2 green
      //2->0>>>traffic 2 yello


  adcon1=0x07;trisa=0;porta=0;trisb.b0=0;trisb.b1=0; trisc=0;portc=0;
  trisb.b2=0;trisb.b3=0;

 for(left=2;left>=0;left--)
    {  if(left==2) right=3;
        else       right=9;
      while (right>=0){
        for(count=0;count<=25;count++){
           portb.B1=1;            portb.B0=0;
           portb.B2=1;            portb.B3=1;

           portc=right;              delay_ms(10);


           portc=left;              delay_ms(10);
             portb.B1=1;            portb.B0=1;
           portb.B2=1;            portb.B3=0;

           portc=right;              delay_ms(10);

           portb.B1=1;              portb.B0=1;
           portb.B2=0;              portb.B3=1;
             portc=left;              delay_ms(10);

           porta.b0=1;      if(count==50&&right==0&&left==0) porta.b0=0;

          }right--;  */