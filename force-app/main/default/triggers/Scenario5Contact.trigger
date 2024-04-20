trigger Scenario5Contact on Contact (before insert, before update) {

    set<Id> accidset = new set<Id>();
    if((trigger.IsBefore && trigger.IsInsert) || (trigger.isBefore && trigger.IsUpdate)){
        for(Contact objcon :trigger.new){
            accidset.add(objcon.AccountId);
        }
      
        map<Id,Account> accmap= new map<Id,Account>();
        for(Account objacc : [select Id,Phone,(select Phone from Contacts) from Account where Id IN: accidset]){
            accmap.put(objacc.Id, objacc);
        }
        
        for(Contact objcon :trigger.new){
            if(accmap.containsKey(objcon.AccountId)){
                accmap.get(objcon.AccountId).Phone=objcon.Phone;
            }
        }
        Database.update(accmap.values(), false);
    }
    
}