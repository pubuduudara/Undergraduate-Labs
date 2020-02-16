#include <avr/io.h> 
#include <util/delay.h>
#define BLINK_DELAY_MS 50

void delay_timer1(){

  TCNT1 = 46786;

  TCCR1A = 0x00;
  TCCR1B = 0b00000100;

  while((TIFR1&0x01)==0)
     
  TCCR1A = 0x00;
  TCCR1B = 0x00;

  TIFR1 = 0x01;
}


int main (void){
  DDRD = DDRD|(1<<5);
  DDRD = DDRD|(1<<4);
  DDRD = DDRD|(1<<3);
  DDRD = DDRD|(1<<2); 
  DDRB |= (1<<5);
  int i = 1;

  
  
  while(1){ 
      {
        PORTB ^= (1<<5);
        delay_timer1();
      }
      for(i=1+1;i<=5;i++){
         PORTD = PORTD | (1<<i); /* set pin 5 high to turn led on */
         _delay_ms(BLINK_DELAY_MS); 
         PORTD = PORTD &~(1<<i); /* set pin 5 low to turn led off */
         _delay_ms(BLINK_DELAY_MS);
      }
      
      for(i=4;i>=2;i--){
         PORTD = PORTD | (1<<i); /* set pin 5 high to turn led on */
         _delay_ms(BLINK_DELAY_MS); 
         PORTD = PORTD &~(1<<i); /* set pin 5 low to turn led off */
         _delay_ms(BLINK_DELAY_MS);
      }
  } 
}
