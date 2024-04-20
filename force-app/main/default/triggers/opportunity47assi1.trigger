trigger opportunity47assi1 on Opportunity (before insert, before update) {

set<Id> accset = new set<Id>();
    for(Opportunity objopp :trigger.new){
        if(objopp.AccountId !=null){
          if(trigger.IsInsert && trigger.IsBefore){
                accset.add(objopp.AccountId);  
            }
            if(trigger.IsUpdate && trigger.IsBefore){
                if(objopp.AccountId != trigger.oldMap.get(objopp.Id).Type){
                    accset.add(objopp.AccountId);
                }
             }
          }
        }
    Map<Id,Account> accmap =new Map<Id, Account>();
    for(Account objacc : [select Id,Rating,SLA__c from Account where Id IN: accset]){
        accmap.put(objacc.Id, objacc);
    }
    for(Opportunity objopp : trigger.new){
        if(accmap.containsKey(objopp.AccountId)){
            if(accmap.get(objopp.AccountId).Rating=='Hot' || accmap.get(objopp.AccountId).Rating=='Warm'){
                objopp.Description=accmap.get(objopp.AccountId).SLA__c;
                objopp.Type='Existing Customer - Upgrade';
            }
            else{
                objopp.Type='';
            }
        }
    }
        
}