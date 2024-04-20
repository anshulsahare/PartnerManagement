trigger AccountTrigger1 on Account (after update) {
    list<messaging.SingleEmailMessage> maillist = new list<messaging.SingleEmailMessage>();
        
        for(Account objacc : trigger.new){
            if(objacc.Rating=='Hot'){
                
                messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
                mail.setToAddresses(new string[] {'anvimore19@gmail.com'});
                mail.setsenderdisplayName('Anshul sahare');
                mail.setsubject('welcome to air india');
                mail.setplaintextbody('hi welcome to air india');
                maillist.add(mail);
            }
        }
    
    if(!maillist.isEmpty()){
        messaging.sendEmail(maillist,false);
    }
             
}