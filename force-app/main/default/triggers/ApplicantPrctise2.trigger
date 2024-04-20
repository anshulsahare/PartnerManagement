trigger ApplicantPrctise2 on Applicant__c (before insert, before update) {
    
    for(Applicant__c objapp : trigger.new){
        if(string.isNotBlank(objapp.Gender__c) && string.isNotBlank(objapp.First_Name__C)){
            if(objapp.Gender__c=='Male'){
                objapp.First_Name__c='Mr '+objapp.First_Name__c;
                    }
            else{
                objapp.First_Name__c='Ms '+objapp.First_Name__c;
                    }
        }
    }
}