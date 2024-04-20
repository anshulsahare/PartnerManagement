trigger AccountTrigger44story4 on Account (after insert, after update) {
List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    
    for(Account objAcc : trigger.new){
        
        if(trigger.isInsert && trigger.isAfter){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {'anvimore19@gmail.com'});
            mail.setSenderDisplayName('Silver Micro');
            mail.setSubject('Welcome');
            mail.setPlainTextBody('Welcome Dude...!!!!');
            mailList.add(mail);  
        }
        
        if(trigger.isUpdate && trigger.isAfter){
            if(objAcc.Rating != trigger.oldMap.get(objAcc.Id).Rating){
                if(objAcc.Rating == 'Hot'){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[] {'anvimore19@gmail.com'});
                    mail.setSenderDisplayName('Silver Micro');
                    mail.setSubject('Account Rating is updated');
                    mail.setPlainTextBody('Account Rating is Updated to Hot. \n Team Airtel');
                    mailList.add(mail);            
                } 
            }  
        }
        
        
    }
}