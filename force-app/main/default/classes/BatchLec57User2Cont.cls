global class BatchLec57User2Cont implements Database.Batchable<sObject>{
    
    Set<Id> successRecordsSet = new Set<Id>();
    Set<Id> failedRecordsSet = new Set<Id>();
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select Id, Level__c,LeadSource from Contact');//48
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> conList){//12
        if(!conList.isEmpty()){
            for(Contact objCon : conList){
                objCon.LeadSource = 'Web';
            }
            
            Database.SaveResult[] result =  Database.update(conList, false); //Partially
            
            Integer index=0;
            
            for(Database.SaveResult sr : result){
                if(sr.isSuccess()){
                    System.debug('Success = '+conList[index].Id);
                    successRecordsSet.add(conList[index].Id);
                    index++;
                }
                else{
                    System.debug('Failed = '+conList[index].Id);
                    failedRecordsSet.add(conList[index].Id);
                    index++;
                }
            }
                        
        }
    }
    
    global void finish(Database.BatchableContext BC){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'anvimore19@gmail.com'});
        mail.setSenderDisplayName('Anshul Sahare');
        mail.setSubject('Success and Failed Record');
        mail.setPlainTextBody('Success = '+successRecordsSet+' Failed '+failedRecordsSet);
        mailList.add(mail);            
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);  
        }
        
    }
}