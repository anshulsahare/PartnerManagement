trigger AccountTrigger44story2 on Account (after update) {
      list<messaging.SingleEmailMessage> maillist = new list<messaging.SingleEmailMessage>();
        
        for(Account objacc : trigger.new){
            
            if(objacc.Rating != trigger.oldMap.get(objacc.Id).Rating){
               
                 if(objacc.Rating=='Hot'){
                messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
                mail.setToAddresses(new string[] {'anvimore19@gmail.com'});
                mail.setSenderDisplayName('Anshul Bhau');
                mail.setsubject('welocome air india');
                mail.setPlainTextBody('hey...your field is updated to hot');
                maillist.add(mail);
            }
        }
      
      }
            
           
        
        if(!maillist.isEmpty()){
            messaging.sendemail(maillist,false);
        }
    }