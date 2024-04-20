trigger OnlineTRiggSce3Account on Account (before insert) {

    set<Name> accset = new set<Name>();
    list<messaging.SingleEmailMessage> maillist = new list<messaging.SingleEmailMessage>();
    for(Account objacc :trigger.new){
        if(!accset.isEmpty()){
              messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
                mail.setToAddresses(new string[] {'anvimore19@gmail.com'});
                mail.setSenderDisplayName('Anshul Bhau');
                mail.setsubject('welocome air india');
                mail.setPlainTextBody('');
                maillist.add(mail);
        }
    }
}