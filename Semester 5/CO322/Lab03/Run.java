import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Run {
    private static int num_of_buckets;
    private static Pattern p = Pattern.compile("[a-zA-Z]+");
    private static Matcher match;

    public static String readFileAsString(String fileName) throws Exception {
        String data = "";
        data = new String(Files.readAllBytes(Paths.get(fileName)));
        return data;
    }
	public static void main(String args[]) {

        if (args.length != 2) { // you have to put file name and number of buckets as cmd arguments
            System.out.println("Input text file as arg 1 & number of buckets as arg 2");

        } else {

        	num_of_buckets = Integer.parseInt(args[1]);
			HashTableImp table0=new HashTableImp(num_of_buckets); // initialize open-hash table
            HashTableImp01 table1=new HashTableImp01(num_of_buckets);
            HashTableImp02 table2= new HashTableImp02(num_of_buckets);

			try {

				String data = readFileAsString(args[0]); // reading the file
				match = p.matcher(data);
                while (match.find()) {
                    String str = match.group();
                    table0.insert(str); // inserting words in different implementations
                    table1.insert(str);
                    table2.insert(str);
                }


                int arr0 []=DataRetrieve.min_max_collisions(table0.array,num_of_buckets);
                int arr1 []=DataRetrieve.min_max_collisions(table1.array,num_of_buckets);
                int arr2 []=DataRetrieve.min_max_collisions(table2.array,num_of_buckets);
                System.out.println("File name "+args[0]+" buckets "+args[1]);
                System.out.println();
                System.out.println("Min-Max Comparison");
                System.out.println("function\t\tMinimum collisions\t\tMaximum collisions\t\tRange");
                System.out.println("hashFun-1"+"\t\t\t"+arr1[0]+"\t\t\t"+arr1[1]+"\t\t\t\t"+(arr1[1]-arr1[0]));
                System.out.println("hashFun-2"+"\t\t\t"+arr0[0]+"\t\t\t"+arr0[1]+"\t\t\t\t"+(arr0[1]-arr0[0]));
                System.out.println("FNV      "+"\t\t\t"+arr2[0]+"\t\t\t"+arr2[1]+"\t\t\t\t"+(arr2[1]-arr2[0]));

                System.out.println();
                float avg0=DataRetrieve.getCollisionsAvg(table0.array,num_of_buckets);
                float avg1=DataRetrieve.getCollisionsAvg(table1.array,num_of_buckets);
                float avg2=DataRetrieve.getCollisionsAvg(table2.array,num_of_buckets);
                System.out.println("Average");
                System.out.println("function\t\t\t Average");
                System.out.println("hashFun-1"+"\t\t\t  "+avg1);
                System.out.println("hashFun-2"+"\t\t\t  "+avg0);
                System.out.println("FNV      "+"\t\t\t  "+avg2);

                System.out.println();
                double std0=DataRetrieve.std_deviation(DataRetrieve.variane(table0.array,num_of_buckets,avg0));
                double std1=DataRetrieve.std_deviation(DataRetrieve.variane(table1.array,num_of_buckets,avg1));
                double std2=DataRetrieve.std_deviation(DataRetrieve.variane(table2.array,num_of_buckets,avg2));
                System.out.println("Standard Deviation");
                System.out.println("hashFun-1"+"\t\t\t  "+std1);
                System.out.println("hashFun-2"+"\t\t\t  "+std0);
                System.out.println("FNV      "+"\t\t\t  "+std2);


			}
			catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
}