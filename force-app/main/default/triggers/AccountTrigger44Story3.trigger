trigger AccountTrigger44Story3 on Account (after update) {
 list <messaging.SingleEmailMessage> maillist = new list<messaging.SingleEmailMessage>();
    for(Account objacc : trigger.new){
        if(objacc.Rating != trigger.oldMap.get(objacc.Id).Rating){
            if(objacc.Rating=='Hot' && trigger.oldMap.get(objacc.Id).Rating=='Cold'){
                messaging.SingleEmailMessage mail =new messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] {'anvimore19@gmail.com'});
                mail.setSenderDisplayName('Anshul Sahare');
                mail.setSubject('welcome to account');
                mail.setPlainTextBody('hii... you finally update the fied from cold to hot');
                maillist.add(mail);
                
            }
        }
    }
}