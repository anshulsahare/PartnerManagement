public with sharing class getRecordDataController {
    @AuraEnabled(cacheable=true)
     public static List<Account> getaccountlist(){
          return [Select Id,Name,Phone From Account ];
     }

     @AuraEnabled(cacheable=true)
     public static List<Contact> getcontacttlist(){
        return [Select Id, FirstName, lastName, Phone From Contact ];
   }
}