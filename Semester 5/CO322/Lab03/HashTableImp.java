/*********************************************
 * CO322: Data structures and algorithms
 * Implementation of the hashTable
 *********************************************/
// Node class objects are used to build the link list.
// Node has following attributes 
// 1. key---> Stores the word	
// 2. data ---> How many times the word appeared on the text	
// 3. Next--> next node object 

class Node {
    String key;
    int data;
    Node next;

    Node(String key, int data) { // for normal nodes
        this.key = key;
        this.data = data;
        this.next = null;
    }
}

// Chain class is used to build the linked list
// adding new node to a chain would be O(1)
class Chain {
    public int numOfNodes = 0;
    Node head;

    Chain() { //initialize with head (next=string=null, data=-1)
        this.head = new Node(null, -1);
    }

    void new_node(String key) { // insert to the head (enqueue O(1))
        Node newNode = new Node(key, 1);
        newNode.next = head;
        this.head = newNode;
    }
}

//  implementation uses hash function 2
class HashTableImp implements HashTable {

    public Chain[] array;
    public int buckets;

    public HashTableImp(int buckets) {
        // create a open hash table with given number of buckets
        this.buckets = buckets;
        this.array = new Chain[buckets];

        for (int i = 0; i < buckets; i++) {
            array[i] = new Chain();
        }

    }

    @Override
    public void insert(String key) {
        boolean found = false;
        int val = hashFunctions.hashFun_2(key, buckets); // hash function 2 is used

        Node head_ = array[val].head;
        while (head_.next != null) {
            if (head_.key.equals(key)) { // given key is already included in the hash table
                found = true;
                head_.data++;
                break;
            }
            head_ = head_.next;
        }
        if (!found) { // given key is not found on the hash table
            array[val].new_node(key); // insert new node
            array[val].numOfNodes += 1;
        }
    }

    @Override
    public int search(String key) {
        int val = hashFunctions.hashFun_2(key, buckets);
        int found = 0;

        Node head_ = array[val].head;
        while (head_.next != null) {
            if (head_.key.equals(key)) { // found the key
                found = head_.data;
                break;
            }
            head_ = head_.next;
        }
        return found;
    }

}
