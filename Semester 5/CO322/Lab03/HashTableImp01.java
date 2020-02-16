// this implementation uses hashFunction 1
class HashTableImp01 implements HashTable {

    public Chain[] array;
    public int buckets;

    public HashTableImp01(int buckets) {
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
        int val = hashFunctions.hashFun_1(key, buckets);

        Node head_ = array[val].head;
        while (head_.next != null) {
            if (head_.key.equals(key)) { // given key is already included in the hash table
                found = true;
                head_.data++;
                break;
            }
            head_ = head_.next;
        }
        if (!found) {
            array[val].new_node(key); // given key is not found on the hash table
            array[val].numOfNodes += 1;
        }
    }

    @Override
    public int search(String key) {
        int val = hashFunctions.hashFun_1(key, buckets);
        int found = 0;

        Node head_ = array[val].head;
        while (head_.next != null) {
            if (head_.key.equals(key)) {
                found = head_.data;
                break;
            }
            head_ = head_.next;
        }
        return found;
    }

}