trigger ApplicantTrigger on Applicant__c (before insert, before update) {
    for(Applicant__c objap : trigger.new){
        if(objap.Gender__c=='Male'){
            objap.Special_Mark_On_Body__c='olala';}
            
            else{
                if(objap.Gender__c=='Female'){
                    objap.Special_Mark_On_Body__c='ohh bhai u r female gender';}
                else{
                    objap.Special_Mark_On_Body__c='you are trans yrr';}
                
                
            }
        
    }
}