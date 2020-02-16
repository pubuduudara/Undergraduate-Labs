//    Premathilaka M.P.U
//    E/15/280

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>
#define ALPHABET (26)

#include "trie.h"

int main(){
    //system("free -t"); //uncomment line 15 & 26 to check memroy consumption
    TrieNode * root=createNode();
    FILE *fp = fopen ("test.txt", "r"); // rename the file.txt to add your own dic
    char str[25];
    clock_t t;

    while (!feof (fp)) {
		    fscanf (fp, "%s", str);
        insertWord (root, str);

    }
    //system("free -t");
    fclose (fp);
    printf("%s\n","words inserted to the Trie --------");

    char input[10];
    while(1){
      printf (">>Type to Suggest:");
		    scanf ("%s", input);
        printSuggestions(root,input);
    }

    //t = clock();
    // add the specifed function to measure the time taken
    //t = clock() - t;
    //double time_taken = ((double)t)/CLOCKS_PER_SEC;
    //printf("took %f seconds\n", time_taken);
    //printf("%s\n","done" );
    return 0;
}
