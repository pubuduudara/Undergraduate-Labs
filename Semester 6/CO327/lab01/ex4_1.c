#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 

int  main(char  argc,  char **argv){
	execl("/bin/ls",  "-l",  argv[1],  NULL);
	puts("Program  ls has terminated");
}