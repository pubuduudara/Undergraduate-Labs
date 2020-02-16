import static java.lang.Math.abs;
import static java.lang.Math.pow;

// hashFunctions class includes all the hash fucntions used for calculations

public final class hashFunctions {
	
	//Fowler-Noll-Vo hash function
    public static int FNV(final String k, int buckets) {
        int rv = 0x811c9dc5;
        final int len = k.length();
        for (int i = 0; i < len; i++) {
            rv ^= k.charAt(i);
            rv *= 0x01000193;
        }
        return abs(rv) % buckets;
    }
	
	// Polynomial hash function
    public static int hashFun_1(String key, int buckets) {
        int val = 0;
        int g = 31;
		for (int i = 0; i < key.length(); i++) {
            int unicode = key.charAt(i)-'a';
            val += pow(g, i) * abs(unicode);
        }

        return val % buckets;
    }
	
	//Character based hash fuction
    public static int hashFun_2(String key, int buckets){
        String lowerCase=key.toLowerCase();
        int val=0;
        for(int i=0;i<lowerCase.length();i++){
            val+=abs(lowerCase.charAt(i)-'a');
        }
        return val%buckets;
    }

}