trigger AccountTrigger2 on Account (before insert, before update) {
    for(Account objap : trigger.new){
      
        if(objap.SlA__c=='Gold')
            {
            objap.Description='ohh you selected gold for this';}
        else{
            if(objap.SLA__c=='Silver'){
                objap.Description='yahoo you selected silver for this';}
            else{objap.Description='' ;}
             }
    }
    
}