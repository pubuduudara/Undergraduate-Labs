#include <stdio.h>
#include <unistd.h>
#include <sys/io.h>
#include <asm/io.h>

#define ADDR 0x210 //base address from the address lines

void main(){
	//check for port access
	if (ioperm(ADDR, 1, 1)){
		fprintf(stderr, "Access denied to %x\n", ADDR),
		exit(1);
	}
	
	//write operation
	unsigned int value = 270;
	unsigned char lower_byte = value;
	unsigned char higher_byte = value >> 8;
	outb(lower_byte, ADDR);
	outb(higher_byte, ADDR + 1);	

	// read operation
	unsigned char byte_read = inb(ADDR);
	printf("%lu", byte_read);
	
}
