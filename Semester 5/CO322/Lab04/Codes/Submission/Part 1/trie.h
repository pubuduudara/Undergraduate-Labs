//    Premathilaka M.P.U
//    E/15/280

//this file includes all necessary functions to create the trie

typedef struct trienode{
    bool endOfWord; // true if the word is ending
    int numberOfChildren;
    struct trienode *children[ALPHABET];
}TrieNode;

int getIndex(char letter);bool isExist(TrieNode * root,char * str);char *join (char *slice, char part);char intToChar(int i);

TrieNode* createNode(){ // to create a node
    TrieNode * newNode=NULL;
    newNode = (TrieNode *)malloc(sizeof(TrieNode));
    newNode->endOfWord=false; // by default
    newNode->numberOfChildren=0;// by default
    int i;
    for(i=0;i<ALPHABET;i++){
        newNode->children[i]=NULL;
    }
    return newNode;
}


TrieNode* insertWord(TrieNode * root,char * pWord){ // insert a given word
    TrieNode * rootUpdate=root;
    int len=strlen(pWord);
    int i;
    for(i=0;i<len;i++){
        int ltrIndex=getIndex(pWord[i]);
          if(!rootUpdate->children[ltrIndex]){ // if the letter is not included in the trie
            rootUpdate->children[ltrIndex]=createNode();// create a new node
            rootUpdate->numberOfChildren+=1;
        }
        rootUpdate=rootUpdate->children[ltrIndex]; // if the letter is included, go to the next node
    }
    rootUpdate->endOfWord=true;
}
int traverse(TrieNode * root,char * prefix){
    if(root->endOfWord==true){ // word ending, can print
      printf("%s\n",prefix );
      if(root->numberOfChildren==0 ){
          return 0;
      }
    }
    int i;
    for(i=0;i<ALPHABET;i++){
        if(root->children[i]!=NULL){
            char letter= intToChar(i);
            traverse(root->children[i],join(prefix,letter)); // merge the letter with word
        }
    }
}

int printSuggestions(TrieNode * root,char * str){
    TrieNode * rootUpdate=root;
    if(!isExist(root,str)) return 0; // check whether any suggestions are available in the trie
    int i;
    for(i=0;i<strlen(str);i++){
        char ltr= *(str+i);
        int ltrIndex=getIndex(ltr);
        rootUpdate=rootUpdate->children[ltrIndex];
      }
    bool endOfWord=rootUpdate->endOfWord;
    int children=rootUpdate->numberOfChildren;
    if(endOfWord==true && children==0){ // end of a word
        return 0;
    }
    if(children>0){ // since there are children have to traverse
        traverse(rootUpdate,str);
        return 1;
    }
}
int getIndex(char letter){ // return alpahbetic index 0-25
    return letter-'a';
}
char intToChar(int i){ // convert int to char
    return i+97;
}

char *join (char *slice, char part) { // combine char with the word
  char *str = (char*)malloc (sizeof (char) * (strlen (slice) + 2));

	int i = 0;
	while (slice[i] != '\0'){
		str[i] = slice[i];
		++i;
	}
  str[i] = part;
	str[++i] = '\0';
  return str;
}

bool isExist(TrieNode * root,char * str){ // used to check available suggestoins
  TrieNode * rootUpdate=root;
  int i;
  for(i=0;i<strlen(str);i++){
    char ltr= *(str+i);
    int ltrIndex=getIndex(ltr);
    if(!rootUpdate->children[ltrIndex]){
        printf("No Suggestions\n");
        return false;
    }
    rootUpdate=rootUpdate->children[ltrIndex];
  }
  return true;
}
