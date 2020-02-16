#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#define blink_delay_ms 100

int main(){
	DDRD=DDRD &~ (1<<2);
	DDRB|=(1<<5);	
	EIMSK |= (1<<INT0);
	EICRA|=(1<<ISC00);
	EICRA|=(1<<ISC01);
	while(1);
}

ISR(INT0_vect){
	PORTB|=(1<<5);
}
