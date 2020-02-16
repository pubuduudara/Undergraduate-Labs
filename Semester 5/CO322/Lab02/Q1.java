public class Q1 {
    static int[][] cost = {{0, 3, 12, 23, 41}, // cost from 0
            {0, 0, 2, 4, 34}, // cost from 1
            {0, 0, 0, 12, 3}, // cost from 2
            {0, 0, 0, 0, 12}, // cost from 3
            {0, 0, 0, 0, 0}  // cost from 4
    };

    static int iMax = 5;
    static int jMax = 5;

    
    static int answer = 8;

    public static int minCost(int i, int j) {
        int ans; 
        int min_cost = cost[i][j]; // keep the current minimum value as the direct path between two stations
        if ((i + 1) == j) { // check the base case of the recursion
            return cost[i][j];
        } else {
            for (int k = i + 1; k < j; k++) { // for current level, calculate all the possible paths from start to end and take the minimum
                ans = minCost(i, k) + minCost(k, j);
                if (ans < min_cost) { // update minimum value
                    min_cost = ans;
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
