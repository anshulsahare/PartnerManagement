public with sharing class lect69AccountProvider {
    
    @AuraEnabled
    public static list<Account> lect69AccountProvider(Account objacc) {
    return [select Id,Name,Rating,Type,SLA__c,CreatedDate from Account where Type =: objacc.Type];
    }
}