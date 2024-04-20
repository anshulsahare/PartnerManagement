public with sharing class applicantProviderThird {

    
     
    @AuraEnabled
    public static Applicant__c applicantProviderThirdMethod(Applicant__c Objapp){
     Applicant__c objRetrieved = [select Id,Name, First_Name__c, Last_Name__c, Gender__c from Applicant__c where Name   =: Objapp.Name];
     return objRetrieved;
    }
}