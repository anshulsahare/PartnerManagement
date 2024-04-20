trigger CotactAccTriggTest on Contact (after insert, after update){
    set<Id> accIdset = new set<Id>();
    for(Contact objcon : trigger.new){
        if(objcon != null){
            accIdset.add(objcon.AccountId);
        }
    }
    Map<Id,Account> accmap = new Map<id,Account>();
    for(Account objcon : [select Id,Description from Account where Id IN : accIdset]){
    if(!accIdset.isEmpty()){
        accmap.put(objcon.Id, objcon);
    }
   }
    for(Contact objcon : trigger.new){
        if(accmap.containsKey(objcon.AccountId)){
            accmap.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName;
        }
    }
    if(!accmap.isEmpty()){
        database.update(accmap.values(), false);
    }
}