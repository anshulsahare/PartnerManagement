global class BatchLec58Story2APPLI implements database.Batchable<sObject>{

global database.querylocator start(database.batchablecontext BC){
       return database.getquerylocator('select Id, First_Name__c, Last_Name__c ,Email_Id__c from Applicant__c where Email_Id__c!=null ');
      }
global void execute(database.batchablecontext BC, list<Applicant__c> applist){
        List<Messaging.SingleEmailMessage> maillist = new List<Messaging.SingleEmailMessage>();
            if(!applist.isempty()){
            for(Applicant__c objapp : applist){
            messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
                        mail.setToAddresses(new string[] {objapp.Email_Id__c});
                        mail.setsenderdisplayName('Anshul sahare');
                        mail.setsubject('HAPPY DIWALI');
                        mail.setplaintextbody('HII Mr'+objapp.First_Name__c+' '+objapp.Last_Name__c+'\n'+'HAPPY DIWALI you and your family...!!'  );
                        maillist.add(mail);
                    }
                }
            
            if(!maillist.isEmpty()){
                messaging.sendEmail(maillist,false);
            }
            }
          
global void finish(database.BatchableContext BC){
    
    }
}