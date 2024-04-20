trigger AccountPrctise2 on Account (before insert, before update) {
    for(Account objacc : trigger.new){
        if(objacc !=null){
            if(objacc.Type=='Prospect'){
                objacc.SLA__c='Gold';
            }
            else{
                if(objacc.Type=='Customer - Direct'){
                    objacc.SLA__c='Silver';
                }
                else{
                    objacc.SLA__c='';
                }
            }
        }
    }
}