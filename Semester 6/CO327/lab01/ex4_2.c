#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 
#include <string.h>

int main(){
	while(1){
		char cmd[10];
		char arg[10];
		printf("Enter command to execute: ");
		scanf("%s",cmd);
		printf("Enter argument: ");
		scanf("%s",arg);

		int x = fork();
		if (x<0){
			printf("Unsuccessful fork\n");
		}
		else if (x==0){
			execl(cmd,arg,NULL);
			printf("execl unsuccessful\n");
		}
		else{
			wait(NULL);
		}
	}


	return 0;
}