trigger Scenario2Applicant on Applicant__c (before insert,before update) {
    
    for(Applicant__c objapp :trigger.new){
        if((objapp.Gender__c=='Male') && (!objapp.First_Name__c.startswith('Mr')) || (!objapp.First_Name__c.startswith('Ms'))){
            objapp.First_Name__c='Mr. '+objapp.First_Name__c;
        }
        else{
        if((objapp.Gender__c=='Female') && (!objapp.First_Name__c.startswith('Ms')) || (!objapp.First_Name__c.startswith('Mr'))){
            objapp.First_Name__c='Ms. '+objapp.First_Name__c;
           }
         else{
            if(objapp.Gender__c=='Transgender'){
               objapp.adderror('this gender is not applicable');
            }
        }
        
        
        }  
        }
      }