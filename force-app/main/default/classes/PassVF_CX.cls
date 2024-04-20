public with sharing class PassVF_CX {
    
    Public Passport__c objp {get; set;}
    public PassVF_CX(ApexPages.StandardController controller) {
    string Status= apexpages.currentpage().getparameters().get('Status');
     objp=[select Name ,Id,Applicant__c,Status__c from Passport__c where Status__c=: Status];
     
    }

}