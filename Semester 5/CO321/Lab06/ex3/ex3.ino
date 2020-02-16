#include <avr/io.h>
#include <util/delay.h>


#define FOSC 16000000 // Clock Speed
#define BAUD 9600
#define MYUBRR FOSC/16/BAUD-1


unsigned char usart_receive( void )
{
  /* Wait for data to be received */
  while ( !(UCSR0A & (1 << RXC0)) );
  /* Get and return received data from buffer */
  return UDR0;
}



void usart_send( unsigned int data )
{
  /* Wait for empty transmit buffer */
  while ( !( UCSR0A & (1 << UDRE0)));
  /* Copy 9th bit to TXB8 */
  UCSR0B &= ~(1 << TXB80);
  if ( data & 0x0100 )
    UCSR0B |= (1 << TXB80);
  /* Put data into buffer, sends the data */
  UDR0 = data;
}



void usart_init( unsigned int ubrr) {
  /*Set baud rate */
  UBRR0H = (unsigned char)(ubrr >> 8);
  UBRR0L = (unsigned char)ubrr;
  //Enable receiver and transmitter
  UCSR0B = (1 << RXEN0) | (1 << TXEN0);
  /* Set frame format: 8data, 2stop bit */
  //UCSR0C = (1<<USBS0)|(3<<UCSZ00);
  UCSR0C = (3 << UCSZ00);
  //UCSR0B |= (1 << UCSZ02);
}



int main( void ) {

  usart_init(MYUBRR);

  char data;
  while (1) {
    //Serial.println(data1[1]);
    data = usart_receive();
    if (data == '\n') {
      usart_send(data);
    }

    if (data > 'z' || (data < 'a' && data > 'Z') || data < 'A') {

    } else {
      data += 3;

      if ((data > 'z') || (data < 'a' && data > 'Z')) {
        data -= 26;

      }
    }



    usart_send(data);
  }

}
