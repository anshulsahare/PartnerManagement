trigger ApplicantTrig on Applicant__c (after insert) {

    List<Messaging.SingleEmailMessage> maillist = new List<Messaging.SingleEmailMessage>();
    for(Applicant__c objapp : trigger.new){
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        mail.setToAddresses(new string[] {objapp.Email_Id__c});
        mail.setSenderDisplayName('sahareanshul17@gmail.com');
        mail.setSubject('your account record has been created');
        mail.setPlainTextBody('hello '+objapp.First_Name__c+' '+objapp.Last_Name__c+'your account record has been created');
        maillist.add(mail);
    }
    messaging.sendEmail(maillist, false);
}