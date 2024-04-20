public with sharing class contactProviedClass {
    
    @AuraEnabled(cacheable=true)
    public static list<Contact> conMethod(string accountId){
     return [SELECT Id,FirstName,LastName,Email,Phone from Contact WHERE AccountId =:accountId];
    }
}