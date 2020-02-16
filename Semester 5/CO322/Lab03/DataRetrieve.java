// DataRetrieve has all the fucntions needed for statistical analysis
 
public class DataRetrieve {
	
	//min_max_collisions returns minimum number of collisions and maximum number of collisions as two element array
	// element[0]= minimum number of collisions , element[1]= maximum number of collisions
    public static int [] min_max_collisions(Chain [] ar,int buckets){ 
        int [] arr_=new int[2];
        int maxColis=0;
        int minColis=Integer.MAX_VALUE;

        for(int i=0;i<buckets;i++){
            int val=ar[i].numOfNodes;
            if (maxColis<val) maxColis=val;
            if (minColis>val) minColis=val;
        }
        arr_[0]=minColis; arr_[1]=maxColis;

        return arr_;
    }
	
	//getCollisions prints all the collisions on the bucket arry
	//collsions are number of nodes connected to the specified bucket chain
    public static void getCollisions(Chain [] ar,int buckets){
        for(int i=0;i<buckets;i++)
            System.out.println(ar[i].numOfNodes);
    }
	
	//getCollisionsAvg returns the average collsion numbers for a given .txt file and for a specified hash fucntion
    public static float getCollisionsAvg(Chain [] ar,int buckets){
        int total=0;
        for(int i=0;i<buckets;i++){
            total+=ar[i].numOfNodes;
        }
        return total/buckets;
    }
	
	//variane returns the variane of collsion numbers for a given .txt file and for a specified hash fucntion
    public static float variane(Chain [] ar,int buckets,float AVG){
        int total=0;
        for(int i=0;i<buckets;i++){
            total+=Math.pow(ar[i].numOfNodes-AVG,2);
        }
        return total/buckets;
    }
	
	//std_deviation returns the standard deviation of collsion numbers for a given .txt file and for a specified hash fucntion
    public static double std_deviation(float variance){
        return Math.sqrt(variance);
    }
}
