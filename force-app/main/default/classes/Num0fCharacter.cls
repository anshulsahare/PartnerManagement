public class Num0fCharacter {
     public static void charCount(string s){
        integer[] chars= s.getChars();
        integer i, lenCAlphabate=0, lenSAlphabate=0, lenSpecialChar=0, lennumber=0;
        for(i=0; i<chars.size(); i++){
            if(65<=chars[i] && chars[i]<=90)
                lenCAlphabate++;
            else if(97<=chars[i] && chars[i]<=122)
                lenCAlphabate++;
            else if(48<=chars[i] && chars[i]<=57)
                lennumber++;
            
            else
                lenSpecialChar++;
        }
        system.debug('Total no of charecter' +chars.size());
        system.debug('Total no of charecter' +lenCAlphabate);
        system.debug('Total no of charecter' +lenSAlphabate);
        system.debug('Total no of charecter' +lenNumber);
        system.debug('Total no of charecter' +lenSpecialChar);
    }
}