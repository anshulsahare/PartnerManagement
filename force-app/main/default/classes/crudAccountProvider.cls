public with sharing class crudAccountProvider {

    @AuraEnabled
    public static string crudAccountProvider(Account objacc) {
     if(objacc != null){
        insert objacc;
        return 'record has been created';
     }
     else {
        return 'locha something';
     }
    }

    @AuraEnabled
    public static Account recordAccountRecord(Account objacc){
      if(objacc != null){
        return [select Id, Name,Type,SLA__c from Account where Name =: objacc.Name];
      }
      else{
         return null;
      }
    }

    @AuraEnabled
    public static Account  updateAccountRecord(Account objacc){
      try {
         update objacc;
         return [select Id, Name,Type,SLA__c from Account where Name =: objacc.Name];
      } catch (Exception e) {
         throw new AuraHandledException(e.getMessage());
      }
    }

    @AuraEnabled
    public static string deleteAccountRecord(Account objacc){
      try {
         delete objacc;
         return 'record has been deleted succesfuly';
      } catch (Exception e) {
         throw new AuraHandledException(e.getMessage());
      }
    }
}