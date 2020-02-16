#include <avr/io.h> 
#include <util/delay.h>
#define BLINK_DELAY_MS 50

void delay_timer0(){

  TCNT0 = 203;

  TCCR0A = 0x00;
  TCCR0B = 0b00000011;//  1:256

  while((TIFR0&0x01)==0)
     
  TCCR0A = 0x00;
  TCCR0B = 0x00;

  TIFR0 = 0x01;
}


void delay_timer00(){

  TCNT0 = 0;

  TCCR0A = 0x00;
  TCCR0B = 0b00000011;//  1:256

  while((TIFR0&0x01)==0)
     
  TCCR0A = 0x00;
  TCCR0B = 0x00;

  TIFR0 = 0x01;
}

//////////////////////////////////

void delay_timer1(){

  TCNT1 = 62411;

  TCCR1A = 0x00;
  TCCR1B = 0b00000100;//  1:16

  while((TIFR1&0x01)==0)
     
  TCCR1A = 0x00;
  TCCR1B = 0x00;

  TIFR1 = 0x01;
}

int main (void){
   
  DDRB |= (1<<5);//50ms
  DDRD |= (1<<2);//50ms
  int i = 0;
  int j;

  while(1){ 

     //  i = 0;
      
        PORTB ^= (1<<5);
       
        for(j=0;j<12;j++){
          delay_timer00();
        }
        delay_timer0();
        i++;

        
        if(i == 10){

            PORTD ^= (1<<2);
            delay_timer1();
            i = 0;
          
        }
                
  } 
}
