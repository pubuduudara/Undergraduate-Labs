//    Premathilaka M.P.U
//    E/15/280

//this file includes all necessary functions to create the ternary tree
typedef struct trienode{
    bool endOfWord; // true if the word is ending
    char letter;
    struct trienode *left, *eq, *right;
}TrieNode;


TrieNode* createNode(char letter){ // store the letter when creating the node
    TrieNode * newNode=NULL;
    newNode = (TrieNode *)malloc(sizeof(TrieNode));
    newNode->endOfWord=false;
    newNode->letter=letter;
    newNode->left = newNode->eq = newNode->right = NULL;
    return newNode;
}

void insertWord(TrieNode ** root,char * pWord){

  if(!(*root)){
    *root=createNode(*pWord);

  }
  if((*root)->letter>(*pWord)){ //if the letter in the node > current letter
    insertWord(&((*root)->left),pWord); // insert current letter to the left node

  }else if((*root)->letter< (*pWord)){//if the letter in the node < current letter
    insertWord(&((*root)->right),pWord); // insert current letter to the right node
  }else{                              //if the letter in the node = current letter
    if(*(pWord+1)){
      insertWord(&((*root)->eq),pWord+1);// insert current letter to the eq node
    }else{
      (*root)->endOfWord=true;
    }
  }
}
char * returnWord(char * prefix, char * postfix);TrieNode * search(TrieNode * root,char * str);

void traverse(TrieNode * root,char * prefix, char* suggestion, int level){// prefix is the proposed word, suggestion-> dynamic
  if (root){
		traverse(root->left,prefix, suggestion, level);
    suggestion[level] = root->letter;
		if (root->endOfWord){
			suggestion[level+1] = '\0';
			printf( "%s\n", returnWord(prefix,suggestion));// combine prefix and postfix
		}
    traverse(root->eq,prefix, suggestion, level + 1);
    traverse(root->right,prefix, suggestion, level);
	}
}
TrieNode * search(TrieNode * root,char * str){// traverse until endOfWord--> true
  if (!root){
    return 0;
  }

  if (*str < root->letter){
    return search(root->left, str);

  }else if (*str > root->letter){
    return search(root->right, str);

  }else{
    if (*(str+1) == '\0'){
      return root->eq; // return the next link
    }
    return search(root->eq, str+1);
  }
}

void printSuggestions(TrieNode * root,char * str){

  TrieNode * rootUpdate=search(root,str);// next node


  char suggestion[15];

	traverse(rootUpdate,str, suggestion, 0);// start travesing from the next node

}
char * returnWord(char * prefix, char * postfix){ // used to combine prefix and postfix
	int lenPrefix=strlen(prefix),lenPostfix=strlen(postfix),len=lenPrefix+lenPostfix;
	char *str = (char*)malloc (sizeof (char) * len + 1);
	int i;
	for(i=0;i<len;i++){
		if(i<lenPrefix){
			str[i]=prefix[i];
		}else{
			str[i]=postfix[i-lenPrefix];
		}
	}
	str[len]='\0';
	return str;
}
