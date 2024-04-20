public with sharing class applicantProviderSecond {

   @AuraEnabled
    public static void appliRecord(Applicant__c objapp){
    if(objapp!=null)
    insert objapp;
  }
}