trigger contact47story2 on Contact (before insert,before update) {
    set<Id> accidset = new set<Id>();
    for(Contact objcon : trigger.new){
        if(objcon.AccountId != null)
            
            if(trigger.Isinsert && trigger.IsBefore){
                accidset.add(objcon.AccountId);
            }
        if(trigger.IsUpdate && trigger.IsBefore){
            if(objcon.AccountId != trigger.oldmap.get(objcon.Id).AccountId){
                accidset.add(objcon.AccountId);
            }
        }
    }
    map<Id, Account> accmap = new map<Id, Account>();
    if(!accidset.isEmpty()){
     for(Account objacc : [select Id, Rating from Account where Id IN : accidset]){
       accmap.put(objacc.Id, objacc); 
      }    
    }
    
    for(Contact objcon : trigger.new){
        if(accmap.containsKey(objcon.AccountId)){
            if(!string.isNotBlank(accMap.get(objcon.AccountId).Rating)){
                    if(accmap.get(objcon.AccountId).Rating=='Hot'){
                    objcon.Level__c='Primary';
                }
                else{
                    if(accmap.get(objcon.AccountId).Rating=='Cold'){
                        objcon.Level__c='Secondary';
                    }
                    else{
                        objcon.Level__c='Tertiary';
                    }
                 }
            }
                else{
                    objcon.Level__c='';
                }
        }
    }
 }