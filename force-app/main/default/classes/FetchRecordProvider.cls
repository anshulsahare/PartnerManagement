public with sharing class FetchRecordProvider {
   
    @AuraEnabled(cacheable=true)
     public static list<Contact> contactFetcher(){
    return [select Id,Name from Contact];
     }
}