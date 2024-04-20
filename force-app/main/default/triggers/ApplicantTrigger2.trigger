trigger ApplicantTrigger2 on Applicant__c (before insert, before update) { 
    for(Applicant__c objap : trigger.new){
        if(objap.Gender__c=='Male' && !objap.First_Name__c.startswith('Mr.')){
            objap.First_Name__c='Mr. '+objap.First_Name__c;}
        else{
            if(objap.Gender__c=='Female' && !objap.First_Name__c.startswith('Ms.')){
                objap.First_Name__c='Ms.'+objap.First_Name__c;}
            else{
                if(objap.Gender__c=='Transgender'){
                    objap.First_Name__c.addError('Transgender is currently not allowed');}
                }
            }
    }
}