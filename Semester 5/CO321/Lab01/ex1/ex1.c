#include <avr/io.h>
#include <util/delay.h>
int main(void){
	DDRB=DDRB|0b00001111;
	while(1){
		PORTB=0xFF;
		_delay_ms(500);
		PORTB=0x00;
		_delay_ms(500);		
	}
}
