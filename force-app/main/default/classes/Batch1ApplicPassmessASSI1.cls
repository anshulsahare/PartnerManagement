global class Batch1ApplicPassmessASSI1 implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator('select Id,Age__c,Passport_message__c from Applicant__c where Age__c<=18 ');
    }
    global  void execute(Database.BatchableContext BC, list<Applicant__c> applist){
        if(!applist.isEmpty()){
            for(Applicant__c objapp : applist){
                objapp.Passport_message__c='Your Passport Has Been Rejectd';
             }
            Database.update(applist, false);
          }
     }
    global void finish(Database.BatchableContext BC){
       Database.executeBatch(new Batch2PassportRejEmailSendASS1());
    }
}