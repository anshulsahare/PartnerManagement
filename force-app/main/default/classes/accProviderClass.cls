public with sharing class accProviderClass {
    public string accountId{get;set;}
    
    @AuraEnabled
    public static void accProviderClassMethod(Account objacc) {
     insert objacc;
    }

    @AuraEnabled(cacheable=true)
    public static list<Account> accToConProvider(){
        try {
            return [select Id,Name from Account limit 30];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}