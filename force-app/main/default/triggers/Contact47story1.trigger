trigger Contact47story1 on Contact (before insert, before update) {
    set<Id> accset = new set<Id>();
    for(Contact objcon : trigger.new){
       if(objcon.AccountId !=null)
              if(trigger.IsInsert && trigger.IsBefore){
               accset.add(objcon.AccountId);
           }
        if(trigger.IsUpdate && trigger.IsBefore){
        if(objcon.AccountId != trigger.oldmap.get(objcon.Id).AccountId){
           accset.add(objcon.AccountId); 
         }
       }
     }
    map<Id,Account> accMap = new map<Id,Account>();
    if(!accset.isEmpty()){
    for(Account objacc :[select Id,Rating from Account where Id IN: accset]){
        accMap.put(objacc.Id, objacc);
    }
   } 
    if(!accMap.isEmpty()){
    for(Contact objcon : trigger.new){
        if(accMap.containsKey(objcon.AccountId)){
            if(accMap.get(objcon.AccountId).Rating=='Hot'){
                objcon.Level__c='Primary';
            }
            else{
                objcon.Level__c='';
            }
        }
    }
    } 
}