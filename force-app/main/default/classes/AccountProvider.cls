public with sharing class AccountProvider {

    @AuraEnabled(cacheable=true)
   public static list<Account> acclistget(string accName){
    return [Select ID, Name ,Rating,Phone, Industry, Description from Account where Name Like : accName LIMIT 50];
   }
    
    }