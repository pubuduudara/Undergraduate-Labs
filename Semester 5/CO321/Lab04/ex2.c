#include <avr/io.h>
int main(){
  DDRD= DDRD | (1<<6); // for pwm (PD6 is the pwm pin)
  CCR0A=0b10000011;
  TCCR0B=0x11;
  while(1){}
  OCR0A=127;
  PORTD |=(1<<6);

}
