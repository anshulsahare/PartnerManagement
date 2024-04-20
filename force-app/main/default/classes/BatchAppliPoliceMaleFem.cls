global class BatchAppliPoliceMaleFem implements database.Batchable<sObject>{
    global database.QueryLocator start(database.BatchableContext BC){
     string strvar='select Id,Gender__c,True_Verification__c,Special_Mark_On_Body__c from Applicant__c where Gender__c != \'Transgender\' ';
     return database.getQueryLocator(strvar);   
    } 
    global void execute(database.BatchableContext BC, list<Applicant__c> applist){
        if(!applist.isEmpty()){
                for(Applicant__c objapp : applist){
                    if(string.isNotBlank(objapp.Gender__c)){
                    if(objapp.Gender__c== 'Male' && !objapp.True_Verification__c){
                        objapp.True_Verification__c=true ;
                        objapp.Special_Mark_On_Body__c='yahoo';
                        system.debug('Inside of Male Conidtion');
                    }
                    else{
                        if(objapp.Gender__c== 'Female' && objapp.True_Verification__c){
                            objapp.True_Verification__c=false;
                        objapp.Special_Mark_On_Body__c='google';
                            system.debug('Inside of Female Conidtion');
                        }
                      }
                    }
                   }
                database.update(applist, false);
            system.debug('after update statement');
            }  
        }
    global void finish(database.BatchableContext BC){
        list<Messaging.SingleEmailMessage>  maillist= new list<Messaging.SingleEmailMessage>();
            
        messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'silvermicrosystems@gmail.com'});
        mail.setSenderDisplayName('Silver Micro');
        mail.setSubject('Applicant Records updated');
        mail.setPlainTextBody('Applicant Records updated. \n Team Airtel');
        mailList.add(mail);   
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);  
        }
    }
 
}