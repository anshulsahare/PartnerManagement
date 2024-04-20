public with sharing class practiseClassProvider {

    @AuraEnabled
    public static Applicant__c practiseClassProvider(Applicant__c objapp){
     Applicant__c Objapli = [select Name, Id, First_Name__c, Last_Name__c, Gender__c from Applicant__c where Name =: objapp.Name ];
     return Objapli;
    } 
}