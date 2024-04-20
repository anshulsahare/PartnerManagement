trigger Practise1trigger on Applicant__c (before insert, before update) {

    for(Applicant__c objappl : trigger.new){
        if(objappl.Gender__c=='Male'){
            objappl.Special_Mark_On_Body__c='Hello you choose male';
        }
        else{
            objappl.Special_Mark_On_Body__c='you choose female or transgender';
        }
    }
    
}