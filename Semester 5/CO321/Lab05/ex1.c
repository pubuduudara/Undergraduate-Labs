#include <avr/io.h>
#include <avr/interrupt.h>
int main(void){
	DDRD |= 31; // output leds
	DDRC &= (0<<1); // analog input
	//ADCSRA |= (1<<7);
	//ADCSRA &= (0<<2);	
	ADCSRA = 0b10000111;
	ADMUX =  0b11100001;	
	ADCSRA |= (1<<3); // local interrupt enable
	sei();
	ADCSRA |= (1<<6);	//start conversion
	while((ADCSRA>>4)&1==0){
		
	}
	PORTD=ADCH;
		 	
	return 0;
}
