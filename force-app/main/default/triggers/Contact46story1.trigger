trigger Contact46story1 on Contact (after insert, after update) {
    set<Id> accidset = new set<Id>();
    for(Contact objcon : trigger.new){
        if(objcon.AccountId !=null)
            accidset.add(objcon.AccountId);
    }
    map<Id, Account> accmap= new map<Id,Account>();
    for(Account objacc : [select id,Description from Account where id IN : accidset]){
        accmap.put(objacc.Id, objacc);
    }
    
    for(Contact objcon :trigger.new){
        if(accmap.containsKey(objcon.AccountId)){
            accmap.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName;
        }
    }
    if(!accmap.isEmpty())
        database.update(accmap.values(), false);
}