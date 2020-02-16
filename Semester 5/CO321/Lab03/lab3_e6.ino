#include <avr/io.h> 
#include <util/delay.h>
#define BLINK_DELAY_MS 50

void delay_timer0(){

  TCNT0 = 150;

  TCCR0A = 0x00;
  TCCR0B = 0b00000100;

  while((TIFR0&0x01)==0)
     
  TCCR0A = 0x00;
  TCCR0B = 0x00;

  TIFR0 = 0x01;
}
void delay_timer00(){

  TCNT0 = 0;

  TCCR0A = 0x00;
  TCCR0B = 0b00000100;

  while((TIFR0&0x01)==0)
     
  TCCR0A = 0x00;
  TCCR0B = 0x00;

  TIFR0 = 0x01;
}

int main (void){
   
  DDRB |= (1<<5);
  int j;
  int count = 0b0;
  int max_ = 0b11111111; 
  int e = 0b11000;//24 rounds
  
  
  while(1){ 
      
        PORTB ^= (1<<5);

          for(j=count;j<e;j=j+0b1){
            delay_timer00(); //rounds
          }          

          delay_timer0();
  } 
}
