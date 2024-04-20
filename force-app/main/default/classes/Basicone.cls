public class Basicone {
    
    public static void updateAccountHistory(List<Account> acclst,Map<Id,Account> oldAccMap)
    {
        for(Account acc:acclst){
            if(acc.Industry != oldAccMap.get(acc.Id).Industry)
            {
                acc.Description = 'Field Name: Industry Old value:' + oldAccMap.get(acc.Id).Industry +'\n'+'New value:' + acc.Industry;
                
                                           
            }
        }
    }



}