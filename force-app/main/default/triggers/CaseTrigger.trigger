trigger CaseTrigger on Case (before insert, before update) {
    for(Case objc : trigger.new){
        if(objc.Status=='New' && objc.Origin=='Phone'){
            objc.Product__c='GC1020';}
        else{
             if(objc.Status=='Working' && objc.Origin=='Web'){
                 objc.Product__c='GC1060';}
                    
                  else{
                       if(objc.Status=='Escalated' && objc.Origin=='Email')
                            objc.Status.Adderror('this case can not be declared');
                    }
                
            }
        
    }
}