#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 


// int main(){

// 	if(fork()==0){
// 		printf("im parent\n");
// 	}else{
// 		printf("im child\n");
// 	}
// 	return 0;
// }



int main() 
{ 
	for(int i=0;i<3;i++) // loop will run n times (n=5) 
	{ 
		fork();
		 
	}  
	printf("sfasf\n");
} 
