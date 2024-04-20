public class StringArrayTest {
    public static List<String> generateStringArray(Integer count) {
        List<String> stringArray = new List<String>();
        
        for (Integer i = 0; i < count; i++) {
            String formattedString = 'Test ' + i;
            stringArray.add(formattedString);
        }
        
        return stringArray;
    }
}