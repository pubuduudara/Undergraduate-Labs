#include <avr/io.h>
#include <util/delay.h>
#define BLINK_DELAY_MS 30
int main(void){
	DDRB=DDRB|0b00001111;
	while(1){
		for(int i=0;i<4;i++){
			PORTB=PORTB|(1<<i);		
			_delay_ms(BLINK_DELAY_MS);
			PORTB=PORTB&~(1<<i);
			_delay_ms(BLINK_DELAY_MS);		
		}
		for(int i=2;i>0;i--){
			PORTB=PORTB|(1<<i);		
			_delay_ms(BLINK_DELAY_MS);
			PORTB=PORTB&~(1<<i);
			_delay_ms(BLINK_DELAY_MS);	
		}		
	}
}
