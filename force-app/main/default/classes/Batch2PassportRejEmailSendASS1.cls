global class Batch2PassportRejEmailSendASS1 implements Database.Batchable<sObject> {
  
    global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator('select Status__c from Passport__c where Applicant__r.Age__c<=18'); 
    }
    global void execute(Database.BatchableContext BC,list<Passport__c> passlist){
        if(!passlist.isEmpty()){
            for(Passport__c objpass : passlist){
                objpass.Status__c='reject';
            }
            Database.update(passlist, false);
        } 
    }
     
    global void finish(Database.BatchableContext BC){
        list <messaging.SingleEmailMessage> maillist = new list<messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage mail =new messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] {'Applicant__c'});
                mail.setSenderDisplayName('Anshul Sahare');
                mail.setSubject('welcome to account');
                mail.setPlainTextBody('Your Status Has Been Rejeted');
                maillist.add(mail);
    }
}