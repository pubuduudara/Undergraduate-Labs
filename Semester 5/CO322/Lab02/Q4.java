import java.util.HashMap;
public class Q4 {
    static int[][] cost = {{0, 3, 12, 23, 41}, // cost from 0
            {0, 0, 2, 4, 34}, // cost from 1
            {0, 0, 0, 12, 3}, // cost from 2
            {0, 0, 0, 0, 12}, // cost from 3
            {0, 0, 0, 0, 0}  // cost from 4
    };

    static int iMax = 5;
    static int jMax = 5;

    static int answer = 8;

    static int hashFunction(int i,int j){ // define the hash function
        int key=((i+j)/2)*(i+j+1) + j; //Cantor pairing function
        return key;
    }

    static HashMap<Integer,Integer> mem=new HashMap<>(); // define hashMap as mem

    public static int minCost(int i, int j) {
        int ans,val_1,val_2;
        int min_cost = cost[i][j];// keep the current minimum value as the direct path between two stations
        if ((i + 1) == j) { // check the base case of the recursion
            return cost[i][j];
        } else {
            for (int k = i + 1; k < j; k++) {
                int key1=hashFunction(i,k);// generate hash key for i,k
                int key2=hashFunction(k,j);// generate hash key for k,j

                if(!mem.containsKey(key1)){ // check whether the key1 is available
                    val_1=minCost(i,k);
                    mem.put(key1,val_1); // save key,value in the hashmap
                }
                else{
                    val_1=mem.get(key1); //get key1 from hashmap
                }
                if(!mem.containsKey(key2)){// check whether the key2 is available
                    val_2=minCost(k,j);
                    mem.put(key2,val_2);// save key,value in the hashmap
                }
                else{
                    val_2=mem.get(key2);//get key2 from hashmap
                }
                ans=val_1+val_2; // calculate result
                if(ans<min_cost){
                    min_cost=ans;
                }

            }
        }

        return min_cost;
    }

    public static void main(String[] args) {
        int r = minCost(0, 4);
        if (r == answer)
            System.out.println("Your implementation might be correct");
        else {
            System.out.println("Too bad. Try again (" + r + ")");
        }
    }
}
