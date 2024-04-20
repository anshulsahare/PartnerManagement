public with sharing class accoundProviderFourth  {
    
    @AuraEnabled
    public static void accoundCreate(Account objAcc){
        if(objAcc != null){
            insert objAcc;
        }
       
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer limitSize, Integer offset){
        List<Account> accountList = [SELECT Id,Name,Rating
                                     FROM Account
                                     ORDER BY CreatedDate
                                     LIMIT :limitSize
                                     OFFSET :offset
                                     ];
        return accountList;
    }
}